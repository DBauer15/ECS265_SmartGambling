pragma solidity >=0.4.22 <0.6.0;

// TODO add more require() checks for state etc
contract SmartRoulette {

    // The creater of the contract is the croupier
    address payable public croupier = msg.sender;

    // A bet saves all data necessary to participate in a round
    struct Bet {
        uint amount;
        uint bet_type;
        bool won;
    }
    mapping(address => Bet[]) public bets;
    address[] addresses;

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
    function EnterBet(uint _bet_type) public payable {
        require(isRoundOpen == true, "No bets are accepted");

        addresses.push(msg.sender);
        bets[msg.sender].push(Bet({
            amount: msg.value,
            bet_type: _bet_type,
            won: false
        }));
    }


    /*
        CROUPIER ACTIONS
    */
    function StartRound() public onlyBy(croupier) {
        require(isRoundOpen == false, "Round already open");

        //ResetBets();
        isRoundOpen = true;
        emit RoundStarted();
    }

    function EndRound() public onlyBy(croupier) {
        require(isRoundOpen == true, "Round already closed");
        isRoundOpen = false;
        emit RoundEnded();

        Payout();
    }


    function EvaluateBets() private {
    }

    function Payout() private {
        //TODO: Wins will be handled here

        uint losses = 0;
        for (uint i = 0; i < addresses.length; i++) {
            for (uint j = 0; j < bets[addresses[i]].length; j++) {
                if (bets[addresses[i]][j].won == false) {
                    losses += bets[addresses[i]][j].amount;
                }
            }
        }

        // Croupier gets losses
        croupier.transfer(losses);
    }

    function ResetBets() private {
        for (uint i = 0; i < addresses.length; i++) {
            delete bets[addresses[i]];
        }
        delete addresses;
    }


    /*
        STATUS ACTIONS
    */
    function IsRoundOpen() public view returns(bool) {
        return isRoundOpen;
    }
}