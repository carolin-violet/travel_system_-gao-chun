<template>
  <div class="">
    <detail :detailData="detailData"/>
  </div>
</template>

<script>
import detail from "@/components/detail";

export default {
  name: "scenic_detail",
  components: {
    detail
  },
  data() {
    return {
      detailData: {}
    }
  },
  created() {
    this.getDetail()
  },
  methods: {
    async getDetail() {
      let res = await this.$axios.get(`/scenic-spot/${this.$route.params.id}`)
      this.detailData = res.data
      this.detailData.price = this.detailData.price.toFixed(2)
      this.detailData.discountPrice = this.detailData.discountPrice.toFixed(2)
    }
  }
}
</script>

<style scoped>

</style>
