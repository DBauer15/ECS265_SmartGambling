<template>
<div>
  <div class="board-cell" :class="getCellColorClass()">
      {{config.number}}
  </div>

</div>
</template>

<script>
export default {
  name: 'BoardCell',
  props: {
    config: Object
  },
  methods: {
    getCellColorClass() {
        return 'board-cell-' + this.config.type;
    }
  },
}
</script>

<style>
    .board-cell {
        border: 0.02em solid black;
        height: 2em;
        width: 2em;
        color: white;
        font-size: 1.5em;
        font-family: serif;
        font-weight: bold;
        line-height: 2em;    
    }
    .board-cell:hover {
        cursor: pointer;
        opacity: 0.7;
    }
    .board-cell-red {
        background-color: red
    }
    .board-cell-black {
        background-color: black
    }
    .board-cell-green {
        background-color: green;
        height: 6.24em;
        line-height: 6.24em;
    }
    .board-cell-split-h {
        background-color: gray;
        height: 0.4em;
    }
    .board-cell-split-v {
        background-color: gray;
        width: 0.4em;
    }
    .board-cell-corner {
        background-color: #ccc;
        height: 0.4em;
        width: 0.4em;
    }
</style>