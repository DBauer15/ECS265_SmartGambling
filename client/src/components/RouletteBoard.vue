<template>
  <div>
    <!--
        <div style="float: left">
            <BoardCell :config="{
                number: 0,
                color: colors[2]
            }"></BoardCell>
        </div>
        -->
    <table>
      <tbody>
        <tr>
          <td rowspan="3">
            <div>
              <BoardCell
                :config="{
                  number: 0,
                  color: colors[3]
                }"
              ></BoardCell>
            </div>
          </td>
          <td rowspan="3" colspan="6">
            <div>
              <div v-for="i in 3">
                <div v-for="j in 12" style="float: left">
                  <BoardCell
                    style="float:left"
                    :config="{
                      number: board_numbers[i - 1][j - 1],
                      type: colors[board_colors[i - 1][j - 1]]
                    }"
                  ></BoardCell>
                  <BoardCell
                    style="float:left"
                    v-if="j != 12"
                    :config="{
                      number: null,
                      type: 'split-v'
                    }"
                  ></BoardCell>
                  <div class="clearfix"></div>
                  <BoardCell
                    style="float:left"
                    v-if="i != 3"
                    :config="{
                      number: null,
                      type: 'split-h'
                    }"
                  ></BoardCell>
                  <BoardCell
                    style="float:left"
                    v-if="j != 12 && i != 3"
                    :config="{
                      number: null,
                      type: 'corner'
                    }"
                  ></BoardCell>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </td>
          <td>asdf</td>
        </tr>
        <tr>
          <td>asdf</td>
        </tr>
        <tr>
          <td>asdf</td>
        </tr>
        <tr>
          <td></td>
          <td colspan="2">asdf</td>
          <td colspan="2">asdf</td>
          <td colspan="2">asdf</td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td>asdf</td>
          <td>asdf</td>
          <td colspan="2">asdf</td>
          <td>asdf</td>
          <td>asdf</td>
          <td></td>
        </tr>
      </tbody>
    </table>

    <div>
      <div v-for="i in 3" style="float: left">
        <div v-for="j in 12" style="float: left">
          <BoardCell
            style="float:left"
            :config="{
              number: board_numbers[i - 1][j - 1],
              type: colors[board_colors[i - 1][j - 1]]
            }"
          ></BoardCell>
          <BoardCell
            style="float:left"
            v-if="j != 12"
            :config="{
              number: null,
              type: 'split-v'
            }"
          ></BoardCell>
          <div class="clearfix"></div>
          <BoardCell
            style="float:left"
            v-if="i != 3"
            :config="{
              number: null,
              type: 'split-h'
            }"
          ></BoardCell>
          <BoardCell
            style="float:left"
            v-if="j != 12 && i != 3"
            :config="{
              number: null,
              type: 'corner'
            }"
          ></BoardCell>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <!--
        <div style="float: left">
            <BoardCell :config="{
                number: 0,
                color: colors[3]
            }">
            </BoardCell>
        </div>
        -->
  </div>
</template>

<script>
import BoardCell from "./BoardCell.vue";

export default {
  components: {
    BoardCell
  },
  data() {
    return {
      colors: ["red", "black", "green", "gray", "white"],
      board_colors: [
        [0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0],
        [1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1],
        [0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0]
      ],
      board_numbers: [
        [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36],
        [2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35],
        [1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34]
      ]
    };
  }
};
</script>

<style>
th,
td {
  border: 1px solid black;
}
</style>
