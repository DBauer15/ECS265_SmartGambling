<template>
  <!-- GAME ROUND CONTAINER -->
  <div class="game-round-status">
    <!-- ROUND STATUS CONTAINER -->
    <div class="round-status">
      <div class="title">ROUND STATUS</div>
      <div
        v-bind:class="$store.state.round_open ? 'round-open' : 'round-closed'"
      >{{$store.state.round_open ? 'Round Open' : 'Round Closed'}}</div>
    </div>

    <!-- ROUND RESULT CONTAINER -->
    <div class="round-result">
      <div class="title">ROUND STATUS</div>
      <div
        class="value"
      >{{$store.state.round_open || $store.state.round_result == -1 ? '-' : $store.state.round_result}}</div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.game-round-status {
  width: 32%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.game-round-status .round-status {
  border: 0.2em solid #ffd700;
  border-radius: 1em;
  height: 40%;
}

.game-round-status .round-result {
  border: 0.2em solid #ffd700;
  border-radius: 1em;
  height: 40%;
}

.game-round-status .title {
  color: #ffd700;
  border-bottom: 0.1em solid #ffd700;
  height: 30%;
  font-weight: 700;
}

.game-round-status .round-result .value {
  color: #ffffff;
}

.game-round-status .round-open {
  color: green !important;
}

.game-round-status .round-closed {
  color: red !important;
}

.game-round-status .round-result {
}
</style>