<template>
  <div class="game-stats">
    <table class="game-stats-table">
      <tr>
        <th class="title" colspan="3">SMART GAMBLING</th>
      </tr>
      <tr>
        <td class="game-stats-td">
          <div class="bet-list scrolling">
          <div v-for="bet in $store.state.bets">
            {{bet.amount}} Ξ on {{bet.bet_type}}-{{bet.bet_number}}
          </div>
          </div>
        </td>
        <td class="game-stats-td" v-bind:class="$store.state.round_open ? 'round-open' : 'round-closed'">{{$store.state.round_open ? 'Round Open' : 'Round Closed'}}</td>
        <td class="game-stats-td">
          Current Prize: {{$store.state.last_prize}} Ξ<br>
          Total Winnings: {{$store.state.total_winnings}} Ξ<br>
          Round Result: {{$store.state.round_open || $store.state.round_result == -1 ? '-' : $store.state.round_result}}
        </td>
        <td class="game-stats-td">
          <div class="bet-button" v-on:click="clear_bets">CLEAR</div><br/>
          <div class="bet-button" v-bind:class="$store.state.round_open ? '' : 'bet-button-inactive'" v-on:click="send_bets">BET</div>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import Api from '../api'


export default {

  mounted() {

  },

  methods: {
    clear_bets() {
      this.$store.state.bets = []
    },
    send_bets() {
      if (!this.$store.state.round_open) {
        return
      }

      for (var bet of this.$store.state.bets) {
        Api.EnterBet(bet.amount, bet.bet_type, bet.bet_number)
      }

      this.clear_bets()
    },
  }

};
</script>

<style>
.round-closed {
  font-size: 1.5em;
  color: red
}

.round-open {
  font-size: 1.5em;
  color: yellow
}

.scrolling {
  overflow-x: hidden;
  overflow-y: auto;
}

.bet-list {
  height: 5em;
}

.game-stats-table {
  width: 70em;
  font-family: serif;
}
.game-stats-td {
  height: 3em;
  width: 24%;
  align-content: center;
}

.bet-button {
  display: inline-block;
  background-color: #ffd700;
  border: 0.1em solid #000000;
  color: black;
  font-size: 1.5em;
  text-align: center;
  cursor: pointer;
  margin: 0.1em;
  padding: 0.1em;
  border-radius: 0.1em;
  min-width: 5em;
}
.bet-button:hover {
  opacity: 0.8;
}
.bet-button:active {
  background-color: #cfb000
}

.bet-button-inactive {
  background-color: #666;
  color: white;
  border: 0.1em solid #333;
}
.bet-button-inactive:hover {
  opacity: 1;
}
.bet-button-inactive:active {
  background-color: #666;
}

.title {
  border: 0.1em solid #ffd700;
  border-radius: 0.2em;
  font-size: 2em;
  font-weight: 900;
  color: #ffd700;
}
.game-stats {
  margin-bottom: 4em;
  color: white;
  font-size: 1.2em;
}
</style>
