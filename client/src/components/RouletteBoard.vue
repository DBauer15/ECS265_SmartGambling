<template>
  <div>
    <table>
      <tbody>

        <tr>
        <td rowspan="5">
          <img src="../assets/wheel.png" width=300 style="margin-right: 2em;">
        </td>
          <td rowspan="3">
            <div>
              <BoardCell
                style="height: 100% !important"
                :config="{
                  text: 0,
                  type: colors[2],
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
                      text: board_numbers[i - 1][j - 1],
                      type: colors[board_colors[i - 1][j - 1]]
                    }"
                  ></BoardCell>
                  <BoardCell
                    style="float:left"
                    v-if="j != 12"
                    :config="{
                      text: null,
                      type: 'split-v'
                    }"
                  ></BoardCell>
                  <div class="clearfix"></div>
                  <BoardCell
                    style="float:left"
                    v-if="i != 3"
                    :config="{
                      text: null,
                      type: 'split-h'
                    }"
                  ></BoardCell>
                  <BoardCell
                    style="float:left"
                    v-if="j != 12 && i != 3"
                    :config="{
                      text: null,
                      type: 'corner'
                    }"
                  ></BoardCell>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </td>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                      text: '2 to 1',
                      type: 'special-v'
                    }"
            ></BoardCell>
          </td>
        </tr>
        <tr>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                      text: '2 to 1',
                      type: 'special-v'
                    }"
            ></BoardCell>
          </td>
        </tr>
        <tr>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                      text: '2 to 1',
                      type: 'special-v'
                    }"
            ></BoardCell>
          </td>
        </tr>
        <tr>
          <td></td>
          <td colspan="2">
            <BoardCell
              style="float:left"
              :config="{
                      text: '1st 12',
                      type: 'special-h3'
                    }"
            ></BoardCell>
          </td>
          <td colspan="2">
            <BoardCell
              style="float:left"
              :config="{
                      text: '2nd 12',
                      type: 'special-h3'
                    }"
            ></BoardCell>
          </td>
          <td colspan="2">
            <BoardCell
              style="float:left"
              :config="{
                      text: '3rd 12',
                      type: 'special-h3'
                    }"
            ></BoardCell>
          </td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td><BoardCell
              style="float:left"
              :config="{
                      text: '1 to 18',
                      type: 'special-h2'
                    }"
            ></BoardCell></td>
          <td><BoardCell
              style="float:left"
              :config="{
                      text: 'Even',
                      type: 'special-h2'
                    }"
            ></BoardCell></td>
          <td><BoardCell
              style="float:left;"
              :config="{
                      text: '♦ Red',
                      type: 'special-h2'
                    }"
            ></BoardCell></td>
          <td><BoardCell
              style="float:left;"
              :config="{
                      text: '♦ Black',
                      type: 'special-h2'
                    }"
            ></BoardCell></td>
          <td><BoardCell
              style="float:left"
              :config="{
                      text: 'Odd',
                      type: 'special-h2'
                    }"
            ></BoardCell></td>
            <td><BoardCell
              style="float:left"
              :config="{
                      text: '19 to 36',
                      type: 'special-h2'
                    }"
            ></BoardCell></td>
          <td></td>
        </tr>
      </tbody>
    </table>
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
      colors: ["red", "black", "green"],
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
table {
  border: none;
}
th,
td {
  border: none;
}
</style>
