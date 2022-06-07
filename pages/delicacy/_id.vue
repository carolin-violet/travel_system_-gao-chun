<template>
  <div class="">
    <detail :detailData="detailData"/>
  </div>
</template>

<script>
import detail from "@/components/detail";
import {getDelicacyDetail} from "@/api";

export default {
  name: "delicacy_detail",
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
      let res = await getDelicacyDetail(this.$route.params.id)
      this.detailData = res.data
    }
  }
}
</script>

<style scoped>

</style>
