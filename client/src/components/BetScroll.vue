/<template>
  <div class="bet-scroll">
    <div class="title">BETS</div>
    <div class="bets">
      <div v-for="bet in $store.state.bets">{{bet.amount}} Ξ on {{bet.bet_type}}-{{bet.bet_number}}</div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.bet-scroll {
  width: 35%;
  border: 0.2em solid #ffd700;
  border-radius: 1em;
  margin: 0 1em;
}

.bet-scroll .title {
  color: #ffd700;
  border-bottom: 0.1em solid #ffd700;
  font-weight: 700;
  padding: 0.7em 0;
}

.bet-scroll .bets {
    width: 100%;
  color: #ffffff;
  text-align: left;
  overflow-x: hidden;
  overflow-y: auto;
  height: 7.5em;
  text-align: center;
  padding: 0.7em 0;
}
</style>