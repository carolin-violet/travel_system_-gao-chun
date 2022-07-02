<template>
  <div>
<!--    景点、美食、旅馆、线路统计-->
    <div ref="baseCount_ref" style="width: 100vw; height: 100vh"></div>
  </div>
</template>

<script>
export default {
  name: "baseCount",
  data() {
    return {
      chartInstance: null,
      allData: [
        {
          name: '景点',
          value: '45'
        },
        {
          name: '拼团线路',
          value: '9'
        },
        {
          name: '美食',
          value: '17'
        },
        {
          name: '旅馆',
          value: '36'
        }
      ]
    }
  },

  mounted() {
    this.allData = this.allData.sort((a, b) => a.value - b.value)
    this.initChart()
    this.updateChart()
    window.addEventListener('resize', this.screenAdapter)
    this.screenAdapter()
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.screenAdapter)
  },

  methods: {
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.baseCount_ref, 'chalk')
      const initOption = {
        title: {
          text: '景点、美食、旅馆、线路统计',
          left: 20,
          top: 20
        },
        xAxis: {
          type: 'value'
        },
        yAxis: {
          type: 'category'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'line',
            z: 0,
            lineStyle: {
              color: '#2D3443'
            }
          }
        },
        series: [
          {
            type: 'bar',
            label: {
              show: true,
              position: 'right'
            },
            itemStyle: {
              color: new this.$echarts.graphic.LinearGradient(0,0,1,0, [
                {
                  offset: 0,
                  color: '#5052EE'
                },
                {
                  offset: 1,
                  color: '#AB6EE5'
                }
              ])
            }
          }
        ]
      }
      this.chartInstance.setOption(initOption)
    },

    updateChart() {
      const nameList = this.allData.map(item => item.name)
      const valueList = this.allData.map(item => item.value)
      const dataOption = {
        yAxis: {
          data: nameList
        },
        series: [
          {
            data: valueList
          }
        ]
      }
      this.chartInstance.setOption(dataOption)
    },

    screenAdapter() {
      const titleFontSize = this.$refs.baseCount_ref.offsetWidth / 100 * 3.6
      const adapterOption = {
        title: {
          textStyle: {
            fontSize: titleFontSize
          }
        },
        series: [
          {
            barWidth: titleFontSize,
            itemStyle: {
              barBorderRadius: [0, titleFontSize/2, titleFontSize/2, 0]
            }
          }
        ]
      }
      this.chartInstance.setOption(adapterOption)
      this.chartInstance.resize()
    }
  }
}
</script>

<style scoped>

</style>
