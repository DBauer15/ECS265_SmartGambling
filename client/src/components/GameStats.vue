<template>
  <!-- game stats -->
  <div class="game-stats-container">
    <!-- logo -->
    <div class="flex-grid">

    </div>
    <!-- stats element container -->
    <div class="flex-grid-thirds">
      <GameRoundStatus></GameRoundStatus>
      <GameBalanceStatus></GameBalanceStatus>
      <BetScroll></BetScroll>
    </div>
  </div>
</template>

<script>
import GameRoundStatus from "./GameRoundStatus.vue";
import GameBalanceStatus from "./GameBalanceStatus.vue";
import BetScroll from "./BetScroll.vue";

export default {
  components: {
    GameRoundStatus,
    GameBalanceStatus,
    BetScroll,
  }
};
</script>

<style>
.game-stats-container {
  width: 40%;
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
