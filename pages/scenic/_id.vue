<template>
  <div class="">
    <detail/>
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

    }
  },
  created() {
    console.log(this.$route.params.id)
  }
}
</script>

<style scoped>

</style>
