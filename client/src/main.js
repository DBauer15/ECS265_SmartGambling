import Vue from 'vue'
import App from './App.vue'
import Api from './api'

Vue.config.productionTip = false


new Vue({
  render: function (h) { return h(App) },
}).$mount('#app')