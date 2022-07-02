<template>
  <div>
<!--    所有景点、美食、旅馆、线路的好评数，悬浮可显示好评与差评数量 -->
    <div ref="comment_ref" style="width: 100vw; height: 100vh"></div>
  </div>
</template>

<script>
export default {
  name: "comment",
  data() {
    return {
      chartInstance: null,
      allData: [
        {
          name: '游子山景区',
          value: [324, 10],  // 分别为好评与差评
          mark: '景点'  // 标志
        },
        {
          name: '正福草堂',
          value: [125, 3],
          mark: '旅馆'
        },
        {
          name: '大闸蟹',
          value: [985, 13],
          mark: '美食'
        },
        {
          name: '氧气把一日游',
          value: [681, 19],
          mark: '线路'
        },
        {
          name: '水慢城',
          value: [2164, 3],
          mark: '景点'
        },
        {
          name: '高淳老街',
          value: [6521, 52],
          mark: '景点'
        },
        {
          name: '桠栖国际慢城',
          value: [99854, 49],
          mark: '景点'
        },
        {
          name: '水八仙',
          value: [263, 12],
          mark: '美食'
        },
        {
          name: '半山旅馆',
          value: [853, 65],
          mark: '旅馆'
        },
      ]
    }
  },

  mounted() {

  },

  methods: {
    initChart() {

    },

    updateChart() {

    },

    screenAdapter() {

    }
  }


}
</script>

<style scoped>

</style>
