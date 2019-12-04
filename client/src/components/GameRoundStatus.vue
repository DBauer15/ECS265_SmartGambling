<template>
  <!-- GAME ROUND CONTAINER -->
  <div class="game-round-status">
    <!-- ROUND STATUS CONTAINER -->
    <div class="round-status">
      <div class="title">ROUND STATUS</div>
      <div
        v-bind:class="$store.state.round_open ? 'round-open' : 'round-closed'"
      >{{$store.state.round_open ? 'Open' : 'Closed'}}</div>
    </div>

    <!-- ROUND RESULT CONTAINER -->
    <div class="round-result">
      <div class="title">ROUND RESULT</div>
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
}

.game-round-status .round-result {
  border: 0.2em solid #ffd700;
  border-radius: 1em;
}

.game-round-status .title {
  color: #ffd700;
  border-bottom: 0.1em solid #ffd700;
  font-weight: 700;
  padding: 0.7em 0;
}

.game-round-status .round-result .value {
  color: #ffffff;
  padding: 0.7em 0;
}

.game-round-status .round-open {
  color: green !important;
  font-weight: 700;
  padding: 0.7em 0;
}

.game-round-status .round-closed {
  color: red !important;
  font-weight: 700;
  padding: 0.7em 0;
}
</style>