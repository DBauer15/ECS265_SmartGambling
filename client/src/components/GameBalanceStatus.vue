<template>
  <div class="game-balance-status">
    <div class="title">ETHEREUM</div>
    <div class="balances">
      <div class="labels">
        Last Prize:
        <br />Previous Winnings:
        <br />Value In Bets:
        <br />Total:
        <br />
      </div>
      <div class="values">
        {{$store.state.last_prize}} Ξ
        <br />
        {{$store.state.previous_winnings}} Ξ
        <br />
        {{$store.state.value_in_bets}} Ξ
        <br />
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.game-balance-status {
  width: 32%;
  border: 0.2em solid #ffd700;
  border-radius: 1em;
  /*   height: 5em !important;
  width: 33%;
  margin: 10 auto;
  padding: 10;
  border: solid 0.1em #cfb000;
  border-radius: 1em; */
}

.game-balance-status .title {
  color: #ffd700;
  border-bottom: 0.1em solid #ffd700;
  height: 30%;
  font-weight: 700;
}

.game-balance-status .balances {
  display: flex;
  justify-content: space-between;
}

.game-balance-status .balances .labels {
  width: 60%;
  color: #ffffff;
  text-align: right;
}

.game-balance-status .balances .values {
  width: 30%;
  color: #ffffff;
  text-align: left;
}

.round-closed {
  font-size: 1.5em;
  color: red;
}

.round-open {
  font-size: 1.5em;
  color: yellow;
}
</style>