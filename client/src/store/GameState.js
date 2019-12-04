import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        round_open: false,
        round_result: -1,
        last_prize: 0,
        previous_winnings: 0,
        value_in_bets: 0,
        selected_chip_value: "1",
        bets: [],
        contract_address: '0xC9209c7E85170Bc5a95f5ADFE9f1b652D845CB80',
        account_address: '0x0B70eC32659c053Fc6e5c96B0B5e829439f11769',
    }
})