pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;

contract BetHelper {

    // A bet saves all data necessary to participate in a round
    struct Bet {
        uint amount;
        uint betType;
        uint betNumber;
        bool won;
    }

    // For each bet type indicates the highest number that is allowed as bet number
    uint[] private highestAllowedBetNumbers = [
        1, // RED/BLACK
        1, // ODD/EVEN
        1, // HIGH/LOW
        2, // Dozens
        2, // Columns
        35, // Straight
        56, // Split
        11, // Street
        21, // Corner
        10 // Six Line
    ];
    // For each bet type indicates the stakes (e.g. an entry of 3 mean the bet pays 3:1)
    uint[] private betStakes = [
        1, // RED/BLACK
        1, // ODD/EVEN
        1, // HIGH/LOW
        2, // Dozens
        2, // Columns
        35, // Straight
        17, // Split
        11, // Street
        8, // Corner
        5 // Six Line
    ];

    // Collection of winning numbers for each bet type
    // Each entry denotes a bet type
    // Each bet type has a number of arrays corresponding to its highest_allowed_bet_number
    // Each of those arrays denotes the winning numbers for that bet type
    mapping(uint => uint[][]) private winningBetNumbers;

    constructor() public {
        winningBetNumbers[0] = [   // RED/BLACK
            [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36],
            [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35]
        ];
        winningBetNumbers[1] = [   // ODD/EVEN
            [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35],
            [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36]
        ];
        winningBetNumbers[2] = [   // HIGH/LOW
            [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],
            [19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
        ];
        winningBetNumbers[3] = [   // Dozens
            [1,2,3,4,5,6,7,8,9,10,11,12],
            [13,14,15,16,17,18,19,20,21,22,23,24],
            [25,26,27,28,29,30,31,32,33,34,35,36]
        ];
        winningBetNumbers[4] = [   // Columns
            [1,4,7,10,13,16,19,22,25,28,31,34],
            [2,5,8,11,14,17,20,23,26,29,32,35],
            [3,6,9,12,15,18,21,24,27,30,33,36]
        ];
        winningBetNumbers[5] = [   // Straight
            [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],
            [13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],
            [25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36]
        ];
        winningBetNumbers[6] = [   //Split
            [1,2],[2,3],[4,5],[5,6],[7,8],[8,9],[10,11],[11,12],[13,14],[14,15],
            [16,17],[17,18],[19,20],[20,21],[22,23],[23,24],[25,26],[26,27],[28,29],[29,30],
            [31,32],[32,33],[34,35],[35,36],

            [1,4],[4,7],[7,10],[10,13],[13,16],[16,19],[19,22],[22,25],[25,28],[28,31],[31,34],
            [2,5],[5,8],[8,11],[11,14],[14,17],[17,20],[20,23],[23,26],[26,29],[29,32],[32,35],
            [3,6],[6,9],[9,12],[12,15],[15,18],[18,21],[21,24],[24,27],[27,30],[30,33],[33,36]
        ];
        winningBetNumbers[7] = [   // Street
            [1,2,3],[4,5,6],[7,8,9],[10,11,12],
            [13,14,15],[16,17,18],[19,20,21],[22,23,24],
            [25,26,27],[28,29,30],[31,32,33],[34,35,36]
        ];
        winningBetNumbers[8] = [   // Corner
            [1,2,4,5],[4,5,7,8],[7,8,10,11],[10,11,13,14],[13,14,16,17],[16,17,19,20],[19,20,22,23],[22,23,25,26],[25,26,28,29],[28,29,31,32],[31,32,34,35],
            [2,3,5,6],[5,6,8,9],[8,9,11,12],[11,12,14,15],[14,15,17,18],[17,18,20,21],[20,21,23,24],[23,24,26,27],[26,27,29,30],[29,30,32,33],[32,33,35,36]
        ];
        winningBetNumbers[9] = [   // Six Line
            [1,2,3,4,5,6],[4,5,6,7,8,9],[7,8,9,10,11,12],[10,11,12,13,14,15],[13,14,15,16,17,18],[16,17,18,19,20,21],
            [19,20,21,22,23,24],[22,23,24,25,26,27],[25,26,27,28,29,30],[28,29,30,31,32,33],[31,32,33,34,35,36]
        ];
    }

    function ValidateBet(BetHelper.Bet memory bet) public view returns(bool) {
        // Cannot bet without a value
        if (bet.amount <= 0) {
            return false;
        }

        // Illegal bet type
        if (bet.betType >= GetHighestAllowedBetType()) {
            return false;
        }

        // Illegal bet number
        if (bet.betNumber > GetHighestAllowedBetNumber(uint(bet.betType))) {
            return false;
        }

        return true;
    }

    function Evaluate(BetHelper.Bet memory bet, uint roundResult) public view returns(bool) {
        for (uint i = 0; i < winningBetNumbers[bet.betType][bet.betNumber].length; i++) {
            if (winningBetNumbers[bet.betType][bet.betNumber][i] == roundResult) {
                return true;
            }
        }

        return false;
    }

    function GetBetStakes(uint betType) public view returns(uint) {
        return betStakes[betType];
    }

    function GetHighestAllowedBetType() public view returns(uint) {
        return highestAllowedBetNumbers.length;
    }

    function GetHighestAllowedBetNumber(uint betType) public view returns(uint) {
        return highestAllowedBetNumbers[betType];
    }
}