<template>
  <!-- game stats -->
  <div class="game-stats-container">
    <!-- logo -->
    <div class="flex-grid">
      <div class="col">
        <img
          src="../assets/logo_placeholder.png"
          width="300"
          class="wheel"
          v-bind:class="$store.state.round_open ? 'wheel-spinning' : 'wheel-still'"
        />
      </div>
    </div>
    <!-- stats element container -->
    <div class="flex-grid-thirds">
      <GameRoundStatus></GameRoundStatus>
      <GameBalanceStatus></GameBalanceStatus>
      <GameRoundButtons></GameRoundButtons>
    </div>
  </div>
</template>

<script>
import GameRoundStatus from "./GameRoundStatus.vue";
import GameBalanceStatus from "./GameBalanceStatus.vue";
import GameRoundButtons from "./GameRoundButtons.vue";

export default {
  components: {
    GameRoundStatus,
    GameBalanceStatus,
    GameRoundButtons
  }
};
</script>

<style>
.game-stats-container {
  width: 70%;
  height: 30em;
}

.game-stats-container .flex-grid {
  display: flex;
}

.game-stats-container .flex-grid .col {
  flex: 1;
  height: 15em;
}

.game-stats-container .flex-grid-thirds {
  display: flex;
  justify-content: space-between;
  height: 13em;
}

/* .scrolling {
  overflow-x: hidden;
  overflow-y: auto;
} */

/* .bet-list {
  height: 5em;
} */

</style>
