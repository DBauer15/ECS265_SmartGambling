<template>
  <div>
    <ul>
      <li>
        <input type="radio" value="1" name="radio" id="radio1" checked/>
        <label for="radio1">Value 1</label>
      </li>
      <li>
        <input type="radio" value="2" name="radio" id="radio2" />
        <label for="radio2">Value 2</label>
      </li>
      <li>
        <input type="radio" value="3" name="radio" id="radio3" />
        <label for="radio3">Value 3</label>
      </li>
    </ul>
  </div>
</template>

<script>
export default {};
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
}
input:checked + label {
  background: red;
}
</style>
