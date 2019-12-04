import store from './store/GameState'
import Web3 from 'web3'
import Abi from './contract_abi'

const SERVER_ADDRESS = 'ws://127.0.0.1:7545'

class Api {

    constructor() {
        this.web3 = new Web3(SERVER_ADDRESS)
        this.contract = new this.web3.eth.Contract(Abi, store.state.contract_address)
        this.contract.events.RoundStarted(null, (error, event) => {
            store.state.round_open = true
            store.state.total_winnings += store.state.last_prize
            store.state.last_prize = 0
        })
        this.contract.events.RoundEnded(null, (error, event) => {
            store.state.round_open = false
            store.state.round_result = event.returnValues.roundResult
        })
        this.contract.events.RoundPrize(null, (error, event) => {
            store.state.last_prize += parseFloat(Web3.utils.fromWei(event.returnValues.prize, 'ether'))
        })
    }

    IsRoundOpen() {
        return this.contract.methods.IsRoundOpen().call()
    }

    EnterBet(amount, bet_type, bet_number) {
        return this.contract.methods.EnterBet(bet_type, bet_number).send({
            from: store.state.account_address,
            gas: 3000000,
            value: Web3.utils.toWei(amount.toString(), 'ether')
        })
    }
}


export default new Api()