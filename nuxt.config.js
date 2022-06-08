export default {
  mode: 'universal',    //  当前渲染使用模式
  head: {               //  页面head配置信息
    title: '高淳国际慢城',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [            //  favicon，若引用css不会进行打包处理
      { rel: 'icon', type: 'image/png', href: '/logo.png' }
    ],
    script: [
      {src: 'https://sidecar.gitter.im/dist/sidecar.v1.js', async: true , defer: true}
    ]
  },
  loading: { color: '#93c5fd' },   //  页面进度条
  css: [                        //  全局css（会进行webpack打包处理）
    '~assets/css/normalize.css',
    'element-ui/lib/theme-chalk/index.css',
    "~assets/iconfont/iconfont.css"
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
