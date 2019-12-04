<template>
  <div class="game-round-buttons">
    <div class="button clear" v-on:click="clear_bets">CLEAR</div>
    <div
      class="button bet"
      v-bind:class="$store.state.round_open ? '' : 'inactive'"
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
  display: flex;
}

.game-round-buttons .button {
  display: inline-block;
  font-weight: 900;
  font-size: 1.5em;
  text-align: center;
  cursor: pointer;
  margin: 0 0.7em;
  padding: 0.5em;
  border-radius: 0.5em;
  min-width: 6em;
  display: table-cell;
  border: 0.1em solid transparent;
  color: white;
}

.game-round-buttons .button.clear {
  border: 0.1em solid #ff0000;
  background-color: #ff0000;

}

.game-round-buttons .button.bet {
  border: 0.1em solid #ecc900;
  background-color: #ecc900;
}

.game-round-buttons .button.clear:hover {
  background-color: #ff3535;
}

.game-round-buttons .button.bet:hover {
  background-color: #ffdf2a;
}

.game-round-buttons .button:active {
  opacity: 0.8;
}

.game-round-buttons .button.inactive {
  background-color: #666;
  color: white;
  border: 0.1em solid #666;
  cursor: default;
  opacity: 0.7;
}

.game-round-buttons .button.inactive:hover {
  background-color: #666;
}

.game-round-buttons .button.inactive:active {
  background-color: #666;
  opacity: 0.7;
}
</style>