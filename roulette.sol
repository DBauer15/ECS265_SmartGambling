pragma solidity >=0.4.22 <0.6.0;

// TODO add more require() checks for state etc
contract SmartRoulette {

    // For each bet type indicates the highest number that is allowed as bet number
    uint[] highest_allowed_bet_numbers = [
        1,
        1,
        1
    ];
    // For each bet type indicates the stakes (e.g. an entry of 3 mean the bet pays 3:1)
    uint[] bet_stakes = [
        1,
        1,
        1
    ];

    // The creater of the contract is the croupier
    address payable public croupier = msg.sender;
    // The value of the contract's bank
    uint bank;

    // A round result contains a color and a number that were rolled
    struct RoundResult {
        uint color; // Green: 0, Red: 1, Black: 2
        uint number; // Ranges from 0 to 36 (inclusive)
    }

    // A bet saves all data necessary to participate in a round
    struct Bet {
        uint amount;
        uint bet_type;
        uint bet_number;
        bool won;
    }
    mapping(address => Bet[]) public bets;
    address payable[] addresses;

    // Indicates the game status
    bool isRoundOpen;

    // Events for game status change
    event RoundStarted();
    event RoundEnded();

    // This modifier can be used to restrict some function calls
    modifier onlyBy(address _account) {
        require(
            msg.sender == _account,
            "Not authorized to execute this action"
        );
        _;
    }


    /*
        PLAYER ACTIONS
    */
    function EnterBet(uint _bet_type, uint _bet_number) public payable {
        require(isRoundOpen == true, "No bets are accepted");

        Bet memory bet = Bet({
            amount: msg.value,
            bet_type: _bet_type,
            bet_number: _bet_number,
            won: false
        });

        require(ValidateBet(bet) == true, "Invalid bet not accepted");

        if (bets[msg.sender].length == 0) {
            addresses.push(msg.sender);
        }
        bets[msg.sender].push(bet);
    }


    /*
        CROUPIER ACTIONS
    */
    function StartRound() public payable onlyBy(croupier) {
        require(isRoundOpen == false, "Round already open");

        // Adjust the bank value
        bank += msg.value;

        //ResetBets();
        isRoundOpen = true;
        emit RoundStarted();
    }

    function EndRound() public onlyBy(croupier) {
        require(isRoundOpen == true, "Round already closed");
        isRoundOpen = false;

        RoundResult memory roundResult = GenerateRoundResult();
        EvaluateBets(roundResult);
        Payout();
        ClearBetPool();

        emit RoundEnded();
    }

    function CroupierWithdraw() public onlyBy(croupier) {
        require(isRoundOpen == false, "Cannot withdraw during an open round");

        uint bank_payout = bank;
        bank = 0;
        croupier.transfer(bank_payout);
    }


    /*
        STATUS ACTIONS
    */
    function IsRoundOpen() public view returns(bool) {
        return isRoundOpen;
    }

    function GetBankValue() public view onlyBy(croupier) returns(uint) {
        return bank;
    }

    /*
        PRIVATE FUNCTIONS
    */
    function ValidateBet(Bet memory bet) private view returns(bool) {
        // Cannot bet without a value
        if (bet.amount <= 0) {
            return false;
        }

        // Illegal bet type
        if (bet.bet_type >= highest_allowed_bet_numbers.length) {
            return false;
        }

        // Illegal bet number
        if (bet.bet_number > highest_allowed_bet_numbers[uint(bet.bet_type)]) {
            return false;
        }

        return true;
    }

    function GenerateRoundResult() private pure returns(RoundResult memory) {
        // TODO generate a real result randomly
        return RoundResult({
            color: 1,
            number: 1
        });
    }

    function EvaluateBets(RoundResult memory roundResult) private {

        for (uint i = 0; i < addresses.length; i++) {
            for (uint j = 0; j < bets[addresses[i]].length; j++) {
                EvaluateBet(bets[addresses[i]][j], roundResult);
            }
        }
    }

    function EvaluateBet(Bet storage bet, RoundResult memory roundResult) private {
        // TODO evaluate bets
        bet.won = true;
    }

    function Payout() private {
        for (uint i = 0; i < addresses.length; i++) {
            for (uint j = 0; j < bets[addresses[i]].length; j++) {
                Bet storage bet = bets[addresses[i]][j];
                if (bet.won == false) {
                    bank += bet.amount;
                } else {
                    uint profit = bet.amount * bet_stakes[bet.bet_type];
                    uint prize = bet.amount + profit;
                    bank -= profit;
                    addresses[i].transfer(prize);
                }
            }
        }
    }

    function ClearBetPool() private {
        for (uint i = 0; i < addresses.length; i++) {
            delete bets[addresses[i]];
        }
        delete addresses;
    }
}