<template>
  <div class="">
    <detail :detailData="detailData"/>
  </div>
</template>

<script>
import detail from "@/components/detail";

export default {
  name: "hotel_detail",
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
      let res = await this.$axios.get(`/hotel/${this.$route.params.id}`)
      this.detailData = res.data
    }
  }
}
</script>

<style scoped>

</style>
