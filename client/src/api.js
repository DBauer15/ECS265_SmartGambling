import Web3 from 'web3'
import Abi from './contract_abi'

const SERVER_ADDRESS = 'ws://127.0.0.1:7545'

class Api {

    constructor() {
        this.web3 = new Web3(SERVER_ADDRESS)
        this.contract = new this.web3.eth.Contract(Abi, '0x0B60Cf0f2547086567814f9f8BB9E408A9366962')
    }

    IsRoundOpen() {
        return this.contract.methods.IsRoundOpen().call()
    }

    EnterBet(bet_type, bet_number) {
        return this.contract.methods.EnterBet(bet_type, bet_number).call()
    }
}


export default new Api()