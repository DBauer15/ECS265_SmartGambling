import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        round_open: false,
        round_result: -1,
        last_prize: 0,
        total_winnings: 0,
        selected_chip_value: 1,
        bets: [],
        contract_address: '0x821eB807941ca09a8d2bff42b742aA79be9aa928',
        account_address: '0xdC85acBc7D611DC9fA3392c5aDC6Df0C5a2310FD',
    }
})