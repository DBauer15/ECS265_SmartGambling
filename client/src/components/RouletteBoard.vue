<template>
  <div>
    <table>
      <tbody>
        <tr>
          <td rowspan="5">
            <img
              src="../assets/wheel.png"
              width="300"
              class="wheel"
              v-bind:class="$store.state.round_open ? 'wheel-spinning' : 'wheel-still'"
            />
          </td>
          <td rowspan="3">
            <div>
              <BoardCell
                style="height: 100% !important"
                :config="{
                  text: 0,
                  bet_type: 5,
                  bet_number: 0,
                  class: colors[2]
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
                      class: colors[board_colors[i - 1][j - 1]],
                      bet_type: 5,
                      bet_number: board_numbers[i - 1][j - 1]
                    }"
                  ></BoardCell>
                  <BoardCell
                    style="float:left"
                    v-if="j != 12"
                    :config="{
                      text: null,
                      class: 'split-v',
                      bet_type: 6,
                      bet_number: getVSplitNumber(i - 1, j - 1)
                    }"
                  ></BoardCell>
                  <div class="clearfix"></div>
                  <BoardCell
                    style="float:left"
                    v-if="i != 3"
                    :config="{
                      text: null,
                      class: 'split-h',
                      bet_type: 6,
                      bet_number: getHSplitNumber(i - 1, j - 1)
                    }"
                  ></BoardCell>
                  <BoardCell
                    style="float:left"
                    v-if="j != 12 && i != 3"
                    :config="{
                      text: null,
                      class: 'corner',
                      bet_type: 8,
                      bet_number: getCornerNumber(i - 1, j - 1)
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
                class: 'special-v',
                bet_type: 4,
                bet_number: 2
              }"
            ></BoardCell>
          </td>
          <td rowspan="5">
            <Chips />
          </td>
        </tr>
        <tr>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                text: '2 to 1',
                class: 'special-v',
                bet_type: 4,
                bet_number: 1
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
                class: 'special-v',
                bet_type: 4,
                bet_number: 0
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
                class: 'special-h3',
                bet_type: 3,
                bet_number: 0
              }"
            ></BoardCell>
          </td>
          <td colspan="2">
            <BoardCell
              style="float:left"
              :config="{
                text: '2nd 12',
                class: 'special-h3',
                bet_type: 3,
                bet_number: 1
              }"
            ></BoardCell>
          </td>
          <td colspan="2">
            <BoardCell
              style="float:left"
              :config="{
                text: '3rd 12',
                class: 'special-h3',
                bet_type: 3,
                bet_number: 2
              }"
            ></BoardCell>
          </td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                text: '1 to 18',
                class: 'special-h2',
                bet_type: 2,
                bet_number: 1
              }"
            ></BoardCell>
          </td>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                text: 'Even',
                class: 'special-h2',
                bet_type: 1,
                bet_number: 1
              }"
            ></BoardCell>
          </td>
          <td>
            <BoardCell
              style="float:left;"
              :config="{
                text: '♦ Red',
                class: 'special-h2',
                bet_type: 0,
                bet_number: 0
              }"
            ></BoardCell>
          </td>
          <td>
            <BoardCell
              style="float:left;"
              :config="{
                text: '♦ Black',
                class: 'special-h2',
                bet_type: 0,
                bet_number: 1
              }"
            ></BoardCell>
          </td>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                text: 'Odd',
                class: 'special-h2',
                bet_type: 1,
                bet_number: 0
              }"
            ></BoardCell>
          </td>
          <td>
            <BoardCell
              style="float:left"
              :config="{
                text: '19 to 36',
                class: 'special-h2',
                bet_type: 2,
                bet_number: 0
              }"
            ></BoardCell>
          </td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import BetHelper from "../mixins/bet_helper";
import BoardCell from "./BoardCell.vue";
import Chips from "./Chips.vue";

export default {
  mixins: [BetHelper],
  components: {
    BoardCell,
    Chips
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
  },
  methods: {
    getVSplitNumber(i, j) {
      return this.board_to_v_split[i][j]
    },
    getHSplitNumber(i, j) {
      return this.board_to_h_split[i][j]
    },
    getCornerNumber(i, j) {
      return this.board_to_corner[i][j]
    },
  }
};
</script>

<style>
table {
  margin-right: 11em;
}

.wheel {
  margin-right: 4em;
}

.wheel-still {
  animation: wheel-spin-animation 120s linear infinite;
}

.wheel-spinning {
  animation: wheel-spin-animation 1.2s linear infinite;
}

@keyframes wheel-spin-animation {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
