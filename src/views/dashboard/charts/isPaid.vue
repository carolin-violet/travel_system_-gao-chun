<template>
  <div>
    <div ref="isPaid_ref" style="width: 100vw; height: 100vh; background-color: #40c9c6"></div>
  </div>
</template>

<script>
export default {
  name: "isPaid",
  data () {
    return {
      chartInstance: null,
      titleFontSize: null
    }
  },

  mounted() {
    this.initChart()
    setTimeout(() => {
      this.updateChart()
    }, 1000)
  },

  methods: {
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.isPaid_ref, 'chalk')
      const initOption = {
        title: {
          text: '支付订单与未支付订单占比'
        },
        series: [
          {
            type: 'pie',
            label: {
              show: false
            },
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
      const seriesData = [156, 12]
      const legendData = ['已支付', '未支付']
      const dataOption = {
        legend: {
          data: legendData
        },
        series: [
          {
            data: seriesData
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
