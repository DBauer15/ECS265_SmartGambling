<template>
  <div class="game-round-buttons">
    <div class="button clear" v-on:click="clear_bets">CLEAR</div>
    <div
      class="button bet"
      v-bind:class="$store.state.round_open ? '' : 'bet-button-inactive'"
      v-on:click="send_bets"
    >BET</div>
  </div>
</template>

<script>
import Api from "../api";

export default {
  methods: {
    clear_bets() {
      this.$store.state.bets = [];
    },
    send_bets() {
      if (!this.$store.state.round_open) {
        return;
      }

      for (var bet of this.$store.state.bets) {
        Api.EnterBet(bet.amount, bet.bet_type, bet.bet_number);
      }

      this.clear_bets();
    }
  }
};
</script>

<style>
.game-round-buttons {
  width: 32%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
}

.game-round-buttons .button {
  display: inline-block;
  color: black;
  font-size: 1.5em;
  text-align: center;
  cursor: pointer;
  margin: 0.1em;
  padding: 0.9em;
  border-radius: 0.5em;
  min-width: 5em;
  vertical-align: middle;
  display: table-cell;
  line-height: 100%;
}

.game-round-buttons .button:hover {
  opacity: 0.8;
}

.game-round-buttons .button:active {
  background-color: #cfb000;
}

.game-round-buttons .button-inactive {
  background-color: #666;
  color: white;
  border: 0.1em solid #333;
}

.game-round-buttons .button-inactive:hover {
  opacity: 1;
}

.game-round-buttons .button-inactive:active {
  background-color: #666;
}

.game-round-buttons .button.clear {
  background-color: red;
}

.game-round-buttons .button.bet {
  background-color: #ffd700;
}
</style>