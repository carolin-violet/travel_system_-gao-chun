<template>
  <div>
    <div ref="isPaid_ref" style="width: 100vw; height: 100vh"></div>
  </div>
</template>

<script>
export default {
  name: "isPaid",
  data () {
    return {
      chartInstance: null,
      titleFontSize: null,
      data: [
        {
          name: '已支付',
          value: 156
        },
        {
          name: '未支付',
          value: 12
        }
      ]
    }
  },

  computed: {
    total() {
      let total = 0
      this.data.forEach(item => {
        total += item.value
      })
      return total
    }
  },

  mounted() {
    this.initChart()
    this.updateChart()
  },

  methods: {
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.isPaid_ref, 'chalk')
      const initOption = {
        title: {
          text: '支付订单与未支付订单占比',
          left: 20,
          top: 20
        },
        legend: {
          top: '5%',
          icon: 'circle'
        },
        tooltip: {
          show: true,
          formatter: arg => {
            console.log(arg)
            return `${arg.name}总数：${arg.value}, 占比：${arg.percent}%`
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
      const seriesData = this.data.map(item => item.value)
      const legendData = this.data.map(item => item.name)
      const dataOption = {
        legend: {
          data: legendData
        },
        series: [
          {
            data: this.data
          }
        ]
      }
      this.chartInstance.setOption(dataOption)
    },

    screenAdapter() {
      this.titleFontSize = this.$refs.isPaid_ref.offsetWidth / 100 * 3.6
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
