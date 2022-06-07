<template>
  <div class="">
    <detail :detailData="detailData"/>
  </div>
</template>

<script>
import detail from "@/components/detail";
import {getHotelDetail} from "@/api";

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
      let res = await getHotelDetail(this.$route.params.id)
      console.log(res.data)
      this.detailData = res.data
    }
  }
}
</script>

<style scoped>

</style>
