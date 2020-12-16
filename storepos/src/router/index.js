import Vue from 'vue'
import VueRouter from 'vue-router'
import Pos from '../views/Pos.vue'
import Aside from '../components/common/aside'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Pos',
    component: Pos
  },
  {
    path: '/aside',
    name: 'Aside',
    component: Aside
  },
]

const router = new VueRouter({
  routes
})

export default router
