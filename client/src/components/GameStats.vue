<template>
  <div class="game-stats">
    <table class="game-stats-table">
      <tr>
        <th class="title" colspan="3">SMART GAMBLING</th>
      </tr>
      <tr>
        <td class="game-stats-td">BET-AMOUNT</td>
        <td class="game-stats-td">asdf</td>
        <td class="game-stats-td"><div class="bet-button">BET</div></td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {};
</script>

<style>
.game-stats-table {
  width: 100em;
  border: 0.1em solid black;
  font-family: serif;
}
.game-stats-td {
  height: 3em;
  border: 0.1em solid black;
  align-content: center;
}
.bet-button {
    background-color: #FFD700;
    width: 3em;
    color: black;
    font-size: 1.5em;
    text-align: center;
}
.title {
    border: 0.1em solid #FFD700;
    border-radius: 0.2em;
  font-size: 2em;
  font-weight: 900;
  color: #FFD700;
}
.game-stats {
  margin-bottom: 4em;
}
</style>
