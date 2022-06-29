<template>
  <div class="relative w-screen min-h-screen bg-gray-200">
    <section class="order-container absolute w-1/2 h-auto bg-white rounded-3xl mt-36 left-1/2 transform -translate-x-1/2">
      <section class="order-header w-full py-3 px-6">
        <strong class="text-3xl">购物车 （全部{{ orderList.length }}）</strong>
      </section>
      <hr>
      <section class="order-body w-full px-6 py-3">
<!--        中间头部说明-->
        <section class="body-header w-full flex space-x-5 items-center text-center font-bold">
          <div class="flex-1">
            <span>全选</span>
            <input type="checkbox" v-model="allChecked" @click="handleCheckAll">
          </div>
          <div class="flex-1">订单名称</div>
          <div class="flex-1">人数统计</div>
          <div class="flex-1">预订时间</div>
          <div class="flex-1">总金额</div>
        </section>
<!--        订单列表-->
        <section class="order-item w-full flex items-center text-center space-x-5 my-5 py-5 bg-gray-100 rounded-2xl" v-for="order in orderList" :key="order.id">
          <div class="flex-1">
            <span>选择</span>
            <input type="checkbox" v-model="order.checked" @click="handleCheck(order.id)">
          </div>
          <div class="flex-1">
            <i :class="{iconfont: true, 'icon-menpiao': order.mark === 'scenic', 'icon-xianlu': order.mark === 'route'}"></i>
            <a ref="nofollow" :href="order.mark === 'scenic' ? `/scenic/${order.commodityId}` : '/route'">{{ order.title }}</a>
          </div>
          <div class="flex-1">
            <div>成年人数：{{ order.adult }}</div>
            <div class="mt-3">未成年人数：{{ order.child }}</div>
          </div>
          <div class="flex-1">{{ order.appointmentTime }}</div>
          <div class="flex-1">￥{{ order.amount.toFixed(2) }}</div>
        </section>
      </section>
      <hr>
      <section class="order-footer w-full px-6">
        <div class="float-right my-3">
          <span>已选商品 <strong>{{ payList.length }}</strong> 件</span>
          <span>合计: <strong class="text-red-500">{{ allAmount }}</strong></span>
          <button>结算</button>
        </div>
      </section>
    </section>
  </div>
</template>

<script>
import {mapState} from "vuex"

export default {
  name: "index",
  data() {
    return {
      orderList: [],
      allChecked: false,
      allAmount: 0,
      payList: [],  // 存放需要支付的每一个商品的id
    }
  },

  computed: {
    ...mapState({
      touristId: state => state.userInfo.id
    })
  },
  created() {
    this.getOrders()
  },
  watch: {
    touristId(newVal, oldVal) {
      if (typeof newVal === "string") {
        this.getOrders()
      }
    },
  },


  methods: {
    // 获取未支付的订单
    async getOrders() {
      let res = await this.$axios.get(`/getAllOrder/${this.touristId}/0`)
      this.orderList = res.data.rows.map(order => {
        order.checked = false
        return order
      })
    },

    // 单选框点击事件
    handleCheck(id) {
      // 点击商品前面的按钮
      let checkedCount = 0
      this.orderList.forEach(order => {
        order.id === id ? order.checked = !order.checked : ''
        order.checked === true ? checkedCount++ : ''
      })
      checkedCount === this.orderList.length ? this.allChecked = true : this.allChecked = false
      this.calcAll()
    },

    // 点击全选
    handleCheckAll() {
      // 点击全选按钮
      if (this.allChecked === false) {
        this.orderList.forEach(order => {
          order.checked = true
        })
      } else {
        this.orderList.forEach(order => {
          order.checked = false
        })
      }
      this.allChecked = !this.allChecked
      this.calcAll()
    },

    // 获取需要支付的商品id和金额
    calcAll() {
      const list = []
      let allAmount = 0
      this.orderList.forEach(order => {
        if (order.checked === true) {
          list.push(order.id)
          allAmount += order.amount
        }
      })
      this.payList = list
      this.allAmount = allAmount.toFixed(2)
    }
  },
}
</script>

<style scoped>

</style>
