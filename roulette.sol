pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;


import "./bethelper.sol";

// TODO add more require() checks for state etc
contract SmartRoulette {

    // Instance of the BetHelper
    BetHelper betHelper = new BetHelper();

    // The creater of the contract is the croupier
    address payable public croupier = msg.sender;
    // The value of the contract's bank
    uint bank;

    mapping(address => BetHelper.Bet[]) public bets;
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

        BetHelper.Bet memory bet = BetHelper.Bet({
            amount: msg.value,
            betType: _bet_type,
            betNumber: _bet_number,
            won: false
        });

        require(betHelper.ValidateBet(bet) == true, "Invalid bet not accepted");

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

        uint roundResult = GenerateRoundResult();
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

    function GenerateRoundResult() private pure returns(uint) {
        // TODO generate a real result randomly
        return 1;
    }

    function EvaluateBets(uint roundResult) private {

        for (uint i = 0; i < addresses.length; i++) {
            for (uint j = 0; j < bets[addresses[i]].length; j++) {
                bets[addresses[i]][j].won = betHelper.Evaluate(bets[addresses[i]][j], roundResult);
            }
        }
    }

    function Payout() private {
        for (uint i = 0; i < addresses.length; i++) {
            for (uint j = 0; j < bets[addresses[i]].length; j++) {
                BetHelper.Bet storage bet = bets[addresses[i]][j];
                if (bet.won == false) {
                    bank += bet.amount;
                } else {
                    uint profit = bet.amount * betHelper.GetBetStakes(bet.betType);
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