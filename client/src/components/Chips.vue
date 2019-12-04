<template>
  <div>
    <ul>
      <li>
        <input type="radio" value="1" name="radio" id="radio1" v-model="$store.state.selected_chip_value" checked/>
        <label for="radio1"><img src="../assets/coin1.svg" width="100"></label>
      </li>
      <li>
        <input type="radio" value="5" name="radio" id="radio2" v-model="$store.state.selected_chip_value" />
        <label for="radio2"><img src="../assets/coin5.svg" width="100"></label>
      </li>
      <li>
        <input type="radio" value="10" name="radio" id="radio3" v-model="$store.state.selected_chip_value" />
        <label for="radio3"><img src="../assets/coin10.svg" width="100"></label>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
};
</script>

<style>
ul {
  list-style: none;
}
li {
  margin-right: 15px;
}
input {
  visibility: hidden;
}
label {
  cursor: pointer;
  opacity: 0.6;
}
input:checked + label {
  opacity: 1;
}
</style>
