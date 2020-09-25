import Vue from 'vue'
import Vuex from 'vuex'


// 1.安装插件
Vue.use(Vuex)

// 2.创建对象
// 单一状态树 即不建议创建多个store
const state = {
  students: [
    {id: 20170000, isChecked: false},
    {id: 20172088, isChecked: false},
    {id: 20172090, isChecked: true},
    {id: 20172134, isChecked: false},
    {id: 20172145, isChecked: false},
    {id: 20172156, isChecked: false},
    {id: 20172161, isChecked: false},
    {id: 20172168, isChecked: false},
    {id: 20172206, isChecked: true},
  ]
}

const getters = {
  students (state) {
    return state.students
  }
}

const store = new Vuex.Store({
  state,
  getters
})

// 3.导出对象
export default store
