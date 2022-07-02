<template>
  <div>
<!--   门票与拼团的总数占比饼图 -->
    <div ref="scenicAndRoute_ref" style="width: 100vw; height: 100vh"></div>
  </div>
</template>

<script>
export default {
  name: "scenicAndRoute",
  data () {
    return {
      chartInstance: null,
      titleFontSize: 0,
      allData: [
        {
          name: '门票',
          value: 156
        },
        {
          name: '拼团',
          value: 132
        }
      ]
    }
  },

  computed: {
    total() {
      let total = 0
      this.allData.forEach(item => {
        total += item.value
      })
      return total
    }
  },

  mounted() {
    this.initChart()
    window.addEventListener('resize', this.screenAdapter)
    this.updateChart()
    this.screenAdapter()
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.screenAdapter)
  },

  methods: {
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.scenicAndRoute_ref, 'chalk')
      const initOption = {
        title: {
          text: '门票和拼团的订单总数占比',
          left: 20,
          top: 20
        },
        legend: {
          top: '10%',
          icon: 'diamond',
          left: '100',
        },
        tooltip: {
          show: true,
          formatter: arg => {
            return `总数：${arg.value}, 占比：${arg.percent}%`
          }
        },
        series: [
          {
            type: 'pie',
            // 默认不显示标签
            label: {
              show: false
            },
            // 悬浮显示标签信息
            emphasis: {
              label: {
                show: true
              }
            }
          }
        ]
      }
      this.chartInstance.setOption(initOption)
    },

    updateChart() {
      const legendData = this.allData.map(item => item.name)
      const dataOption = {
        legend: {
          data: legendData
        },
        series: [
          {
            data: this.allData
          }
        ]
      }
      this.chartInstance.setOption(dataOption)
    },

    screenAdapter() {
      this.titleFontSize = this.$refs.scenicAndRoute_ref.offsetWidth / 100 * 3.6
      const adapterOption = {
        title: {
          textStyle: {
            fontSize: this.titleFontSize
          }
        },
        legend: {
          itemWidth: this.titleFontSize,
          itemHeight: this.titleFontSize,
          itemGap: this.titleFontSize / 2,
          textStyle: {
            fontSize: this.titleFontSize / 2
          }
        },
        series: [
          {
            radius: this.titleFontSize * 4.5,
            center: ['50%', '60%']
          }
        ]
      }
      this.chartInstance.setOption(adapterOption)
      this.chartInstance.resize()
    },

  }
}
</script>

<style scoped>

</style>
