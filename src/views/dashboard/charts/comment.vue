<template>
  <div>
<!--    所有景点、美食、旅馆、线路的好评数，悬浮可显示好评与差评数量 -->
    <div ref="comment_ref" style="width: 100%; height: 100%"></div>
  </div>
</template>

<script>
export default {
  name: "comment",
  data() {
    return {
      chartInstance: null,
      startValue: 0,
      endValue: 5,
      timerId: null,
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
          value: [9985, 49],
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
        {
          name: '红烧肉',
          value: [853, 65],
          mark: '美食'
        },
        {
          name: '鲑鱼',
          value: [996, 65],
          mark: '美食'
        },
        {
          name: '陇上',
          value: [8435, 199],
          mark: '旅馆'
        },
        {
          name: '固城湾',
          value: [4597, 65],
          mark: '景点'
        },
        {
          name: '高淳博物馆',
          value: [6574, 65],
          mark: '景点'
        },
        {
          name: '蟹黄包',
          value: [8539, 65],
          mark: '美食'
        },
      ]
    }
  },

  mounted() {
    this.initChart()
    this.updateChart()
    this.screenAdapter()
    this.startInterval()
    window.addEventListener('resize', this.screenAdapter)
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.screenAdapter)
    clearInterval(this.timerId)
  },

  methods: {
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.comment_ref, 'chalk')
      const initOption = {
        title: {
          text: '评论对比',
          top: 20,
          left: 20
        },
        legend: {
          top: '10%',
          left: '100'
        },
        grid: {
          top: '35%',
          left: '5%',
          right: '5%',
          bottom: '5%',
          containLabel: true
        },
        tooltip: {
          show: true,
          trigger: 'axis'
        },
        xAxis: {
          type: 'category'
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            type: 'bar',
          }
        ]
      }
      this.chartInstance.setOption(initOption)
      this.chartInstance.on('mouseover', () => {
        clearInterval(this.timerId)
      })
      this.chartInstance.on('mouseout', () => {
        this.startInterval()
      })
    },

    updateChart() {
      const colorArr = [
        ['#fbc2eb', '#a6c1ee'],
        ['#d4fc79', '#96e6a1'],
        ['#5ee7df', '#b490ca'],
        ['#b3ffab', '#12fff7']
      ]
      this.allData = this.allData.sort((a, b) => (b.value[0] + b.value[1]) - (a.value[0] + a.value[1]))
      const nameList = this.allData.map(item => item.name)
      const sumCommentList = this.allData.map(item => item.value[0] + item.value[1])
      const dataOption = {
        tooltip: {
          formatter: arg => {
            const itemObj = this.allData.find(item => item.name === arg[0].name)
            return `${itemObj.name}(${itemObj.mark})的好评率为：${this.getCommentRate(itemObj.value[0], itemObj.value[1])}`
          }
        },
        dataZoom: {
          show: false,
          startValue: this.startValue,
          endValue: this.endValue
        },
        xAxis: {
          data: nameList
        },
        series: [
          {
            data: sumCommentList,
            label: {
              show: true,
              position: 'top'
            },
            itemStyle: {
              color: arg => {
                let targetArr = null
                const itemObj = this.allData.find(item => item.name === arg.name)
                switch (itemObj.mark) {
                  case '线路' : targetArr = colorArr[3];break;
                  case '景点' : targetArr = colorArr[1];break;
                  case '美食' : targetArr = colorArr[0];break;
                  case '旅馆' : targetArr = colorArr[2];break;
                }
                return new this.$echarts.graphic.LinearGradient(0,0,0,1, [
                  {
                    offset: 0,
                    color: targetArr[0]
                  },
                  {
                    offset: 1,
                    color: targetArr[1]
                  }
                ])
              }
            }
          }
        ]
      }
      this.chartInstance.setOption(dataOption)
    },

    screenAdapter() {
      const titleFontSize = this.$refs.comment_ref.offsetWidth / 100 * 3.6
      const adapterOption = {
        title: {
          textStyle: {
            fontSize: titleFontSize
          }
        },
        series: [
          {
            barWidth: titleFontSize * 2,
            itemStyle: {
              barBorderRadius: [titleFontSize / 2, titleFontSize / 2, 0, 0]
            }
          }
        ]
      }
      this.chartInstance.setOption(adapterOption)
      this.chartInstance.resize()
    },

    // 计算好评率
    getCommentRate(positive, negative) {
      let res = null
      if (negative === 0 && positive !== 0) {
        res = negative
      } else if (positive === 0) {
        res = 0
      } else {
        res = positive / (positive + negative)
      }
      return res.toFixed(6)
    },

    // 启动计数器
    startInterval () {
      if (this.timerId) {
        clearInterval(this.timerId)
      }
      this.timerId = setInterval(() => {
        this.startValue++
        this.endValue++
        if (this.endValue > this.allData.length - 1) {
          this.startValue = 0
          this.endValue = 5
        }
        this.updateChart()
      }, 2000)
    }
  },

}
</script>

<style scoped>

</style>
