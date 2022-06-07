<template>
  <div class="">
    <detail :detailData="detailData"/>
  </div>
</template>

<script>
import detail from "@/components/detail";
import {getScenicSpotDetail} from "@/api";

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
      let res = await getScenicSpotDetail(this.$route.params.id)
      this.detailData = res.data
    }
  }
}
</script>

<style scoped>

</style>
