<template>
  <div class="relative w-screen min-h-screen bg-gray-200">
    <section class="order-container absolute w-1/2 h-auto bg-white rounded-3xl mt-36 left-1/2 transform -translate-x-1/2">
      <section class="order-header py-3 px-6">
        <strong class="text-3xl">购物车 （全部1）</strong>
      </section>
      <hr>
      <section class="order-body px-6">
        a
      </section>
      <hr>
      <section class="order-footer px-6"></section>
    </section>
  </div>
</template>

<script>
import {mapState} from "vuex"
import {state} from "@/store";

export default {
  name: "index",
  data() {
    return {

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
    }
  },
  methods: {
    async getOrders() {
      let res = await this.$axios.get(`/getAllOrder/${this.touristId}/0`)
      this.orderList = res.data.rows
    }
  },
}
</script>

<style scoped>

</style>
