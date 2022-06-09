<template>
<!--  首页-->
  <div class="w-full h-full z-20">
    <!--      屏幕可视区域-->
    <section class="w-screen h-screen">
      <div class="relative w-full h-full">
<!--        文章主体部分-->
        <section class="absolute w-1/2 h-1/2 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-black bg-opacity-40 text-white rounded-lg shadow-2xl">
          <article class="absolute w-full top-10 left-1/2 transform -translate-x-1/2 text-left text-3xl font-serif px-8">
<!--            文章标题-->
            <h1 class="text-center">{{ article[articleIndex].title }}</h1>
<!--            文章内容-->
            <span class="tracking-widest leading-10">&nbsp;&nbsp;&nbsp;&nbsp;{{ article[articleIndex].content }}
            </span>
          </article>
<!--          切换按钮-->
          <div class="absolute flex space-x-10 bottom-5 left-1/2 transform -translate-x-1/2">
            <div @click="changeArticle(0)" :class="articleIndex === 0 ? 'active' : ''" class="w-10 h-10 rounded-full border-2 border-white hover:bg-indigo-200 hover:border-transparent cursor-pointer"></div>
            <div @click="changeArticle(1)" :class="articleIndex === 1 ? 'active' : ''" class="w-10 h-10 rounded-full border-2 border-white hover:bg-indigo-200 hover:border-transparent cursor-pointer"></div>
            <div @click="changeArticle(2)" :class="articleIndex === 2 ? 'active' : ''" class="w-10 h-10 rounded-full border-2 border-white hover:bg-indigo-200 hover:border-transparent cursor-pointer"></div>
          </div>
        </section>
<!--        屏幕下滑按钮-->
        <section  @click="handleScroll" class="absolute w-40 h-40 bottom-8 left-1/2 transform -translate-x-1/2 text-center">
          <i class="iconfont icon-arrowdown text-9xl text-indigo-300 cursor-pointer"></i>
        </section>
<!--        首页背景图-->
        <img class="w-full h-full overflow-x-hidden" src="/固城湖.webp" alt="">
      </div>
    </section>

<!--屏幕下方不可见部分-->
    <section class="w-full h-auto">
      <!--      轮播图上面的一些小信息-->
      <section class="relative w-full h-48">
        <div class="absolute w-1/6 h-48 left-1/2 transform -translate-x-1/2 space-y-6 text-center pt-6 text-indigo-300">
          <span class="block text-5xl">度假旅馆</span>
          <span class="block text-4xl">RESORT HOTEL</span>
          <span class="block w-24 h-2 rounded-3xl bg-indigo-300 mx-auto"></span>
        </div>
        <div class="triangle absolute w-1/6 h-12 right-0 bottom-1 text-2xl text-right pr-16 bg-indigo-300 text-white pt-2 cursor-pointer" @click="getMore(mark[0])">
          了解更多 <i class="iconfont icon-long-arrow-right"></i>
        </div>
      </section>
      <indexSwiper :list="hotelList" :mark="mark[0]"></indexSwiper>

      <!--      轮播图上面的一些小信息-->
      <section class="relative w-full h-48">
        <div class="absolute w-1/6 h-48 left-1/2 transform -translate-x-1/2 space-y-6 text-center pt-6 text-indigo-300">
          <span class="block text-5xl">热门景区</span>
          <span class="block text-4xl">POPULAR AREA</span>
          <span class="block w-24 h-2 rounded-3xl bg-indigo-300 mx-auto"></span>
        </div>
        <div class="triangle absolute w-1/6 h-12 right-0 bottom-1 text-2xl text-right pr-16 bg-indigo-300 text-white pt-2 cursor-pointer" @click="getMore(mark[1])">
          了解更多 <i class="iconfont icon-long-arrow-right"></i>
        </div>
      </section>
      <indexSwiper :list="scenicSpotList" :mark="mark[1]"></indexSwiper>

      <!--      轮播图上面的一些小信息-->
      <section class="relative w-full h-48">
        <div class="absolute w-1/6 h-48 left-1/2 transform -translate-x-1/2 space-y-6 text-center pt-6 text-indigo-300">
          <span class="block text-5xl">美味小吃</span>
          <span class="block text-4xl">FANTASTIC FOOD</span>
          <span class="block w-24 h-2 rounded-3xl bg-indigo-300 mx-auto"></span>
        </div>
        <div class="triangle absolute w-1/6 h-12 right-0 bottom-1 text-2xl text-right pr-16 bg-indigo-300 text-white pt-2 cursor-pointer" @click="getMore(mark[2])">
          了解更多 <i class="iconfont icon-long-arrow-right"></i>
        </div>
      </section>
      <indexSwiper :list="delicacyList" :mark="mark[2]"></indexSwiper>

    </section>
  </div>
</template>

<script>
import indexSwiper from "~/components/index/indexSwiper";

export default {
  name: 'IndexPage',
  components: {
    indexSwiper
  },
  data () {
    return {
      article: [
        {
          title: "高淳国际慢城由来",
          content: "2010年7月，意大利波利卡市市长、世界慢城联盟副主席安杰罗瓦萨罗来到桠溪，看了依山傍水、鸟语花香、树木葱茏的桠溪“生态之旅”，感到十分惊讶。他认为这里的一切，完全符合“国际慢城”的标准。2010年11月27日，在苏格兰召开的国际慢城会议上，桠溪“生态之旅”被正式授予“国际慢城”称号。这样，在大多数中国人对“慢城”的概念还十分陌生的时候，生态环境保护良好的桠溪“生态之旅”成为了中国首个“国际慢城”。"
        },
        {
          title: "高淳概况",
          content: "高淳，位于中国文化名城南京的最南端，东临苏锡常，西接安徽，是“日出斗金、日落斗银”的江南鱼米之乡。清乾隆皇帝下江南时钦赐高淳“江南圣地”的美誉。近年来，高淳区紧紧围绕“现代活力新副城、美丽南京示范区、创新名城南部支点”的发展定位，全力推动高质量发展，加快建设“强富美高”新高淳，形成了“四个富一个引领”的特色和优势。高淳拥有“跳五猖”、“目连戏”、“大马灯”等一批国家和省市级非物质文化遗产，是全国文化先进区、苏南唯一的省级文化生态保护实验区、江苏省历史文化名城。高淳是中国螃蟹之乡，全区拥有20多万亩螃蟹养殖面积，国家地理标志产品“固城湖”螃蟹具有全国第一个水产类中国驰名商标等“五个全国第一”的美誉，拥有全国最大的螃蟹交易市场。高淳区位于南京市南部，被誉为南京的后花园和南大门。"
        },
        {
          title: "慢城理念",
          content: "我们一直在寻找这样的城镇：那里的居民仍对过去充满好奇；有众多剧院、广场、咖啡厅、作坊、餐馆等丰富人们精神生活的场所；有保留完好的历史景观和魅力十足的手工艺者；有真正尊重口味、健康和风俗的产品，人们在此体验四季轮回的美妙。慢城力图加强当地生产者和消费者的对话和交流。慢城理念涵盖环境保护、推广可持续发展、提高生活质量，鼓励食物生产采用自然、环境友好型技术。慢城联盟将管理者、市民和希望分享共同经验的会员联系起来，其内涵从高品质食物扩展至可持续性、热情好客、社会服务等方面；推广新的农耕方式，支持道德消费者。面对当今问题，在不损害自身的前提下利用全球化积极方面，同时保持社区特性和精神，这就是慢城的目标。 "
        }
      ],
      articleIndex: 1,
      mark:['hotel', 'scenic', 'delicacy']
    }
  },
  methods: {
    // 改变当前显示的文章
    changeArticle(index) {
      this.articleIndex = index
    },

    // 屏幕下滑
    handleScroll() {
      window.scroll(0, window.screen.height*0.85)
    },

    // 查看更多
    getMore(mark) {
      this.$router.push({
        path: `/${mark}`
      })
    }
  },
  async asyncData(context) {
    let res = await context.app.$axios.get("/getIndexContent")
    console.log(res.data.items)
    return res.data.items
  }
}
</script>

<style scoped>
.active{
  background-color: #c7d2fe;
}

.triangle::before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  border-top: 1.5rem solid white;
  border-right: 3rem solid transparent;
  border-bottom: 1.5rem solid transparent;
  border-left: 3rem solid white;
}
</style>
