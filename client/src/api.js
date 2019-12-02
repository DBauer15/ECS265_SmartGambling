import Web3 from 'web3'
import Abi from './contract_abi'

const SERVER_ADDRESS = 'ws://127.0.0.1:7545'

class Api {

    constructor() {
        this.web3 = new Web3(SERVER_ADDRESS)
        this.contract = new this.web3.eth.Contract(Abi, '0xcE56341Fdea82B7D26609aAA2265998206486C1C')
    }

    IsRoundOpen() {
        return this.contract.methods.IsRoundOpen().call()
    }
}


export default new Api()