export default {
  mode: 'universal',    //  当前渲染使用模式
  head: {               //  页面head配置信息
    title: '高淳国际慢城-南京后花园',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '高淳，位于中国文化名城南京的最南端，东临苏锡常，西接安徽，是“日出斗金、日落斗银”的江南鱼米之乡。高淳是中国螃蟹之乡，全区拥有20多万亩螃蟹养殖面积，国家地理标志产品“固城湖”螃蟹具有全国第一个水产类中国驰名商标等“五个全国第一”的美誉，拥有全国最大的螃蟹交易市场。高淳区位于南京市南部，被誉为南京的后花园和南大门。2010年11月27日，在苏格兰召开的国际慢城会议上，桠溪“生态之旅”被正式授予“国际慢城”称号。这样，在大多数中国人对“慢城”的概念还十分陌生的时候，生态环境保护良好的桠溪“生态之旅”成为了中国首个“国际慢城”。' },
      {name: "keywords", content: "国际慢城,中国首个,南京后花园"},
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [            //  favicon，若引用css不会进行打包处理
      { rel: 'icon', type: 'image/png', href: '/logo.png' }
    ],
    script: [
      {src: 'https://sidecar.gitter.im/dist/sidecar.v1.js', async: true , defer: true},
    ]
  },
  loading: { color: '#93c5fd' },   //  页面进度条
  css: [                        //  全局css（会进行webpack打包处理）
    '~assets/css/normalize.css',
    'element-ui/lib/theme-chalk/index.css',
    "~assets/iconfont/iconfont.css",
    "~assets/font/font.css"
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    { src: "~/plugins/swiper.js", ssr: false },
    { src: '@/plugins/font-awesome' },
    { src: '~/plugins/vue-aplayer', mode: 'client' },
    {src: '~/plugins/element-ui', ssr: true },
    {src:'~/plugins/store-cache', ssr:false},
    './plugins/axios.js'
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/tailwindcss
    '@nuxtjs/tailwindcss',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    'cookie-universal-nuxt',
    "@nuxtjs/axios",
  ],

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    vendor: ['axios', 'element-ui'],
  }
}
