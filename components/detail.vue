<template>
  <!--    主体内容-->
  <div class="relative detail-container w-screen h-auto pt-28 bg-black">
      <!--    上半部分介绍-->
      <section class="info-container w-full h-auto">
        <div class="float-left mx-48" style="width: 640px; height: 400px">
          <detail-swiper :photosList="detailData.photosList"/>
        </div>
        <div class="float-left text-3xl px-8 pt-6 bg-black bg-opacity-60 text-white" style="width: 900px; height: 400px">&nbsp;&nbsp;{{ detailData.description}}</div>
      </section>

      <!--      评论区-->
      <section class="w-full flex mt-3" style="height: 900px ">
<!--        评论展示-->
        <section class="flex-1 h-full">
<!--          用户评论-->
          <section class="w-11/12 h-5/6 space-y-10" v-if="commentList.length > 1">
            <div class="relative w-5/6 h-1/6 bg-purple-500 mx-auto text-black" v-for="comment in commentList" :key="comment.id">
              <div class="absolute w-48 h-full bg-yellow-300 space-y-3 text-center pt-3.5">
                <div class="w-12 h-12 mx-auto"><img src="/固城湖.webp" alt="" class="w-12 h-12 rounded-full"></div>
                <div class="text-xl overflow-x-hidden">{{ comment.nickName }}</div>
                <div class="text-xl">{{ formatDateTime(comment.time) }}</div>
              </div>
              <div class="absolute relative w-4/5 h-full left-48 bg-gray-600 text-2xl pt-3.5">&nbsp;&nbsp;{{ comment.comment }}</div>
            </div>
          </section>
          <section class="w-11/12 h-5/6 space-y-10 text-4xl text-center text-white"  v-else>
            暂无评论
          </section>


<!--          分页器-->
          <section class="w-full h-1/6" v-show="commentList.length > 1">
            <div class="w-full h-32 mx-auto space-x-3 text-center pt-8">
              <pagination :cur="cur" :limit="limit" :total="total" :continueNum="continueNum" @changePage="changePage"/>
            </div>
          </section>
        </section>
<!--        写评论-->
        <section class="flex-1 h-full text-center pt-16">
          <div class="w-4/5 h-3/5 mx-auto text-4xl space-y-16">
            <h2 class="text-left">好评率：{{ applauseRate }}</h2>
            <h3 class="text-black">尊敬的游客，您可以在下方发表您的意见</h3>
            <div class="w-full h-96">
              <textarea v-model="comment" cols="30" rows="10" class="w-full h-full bg-indigo-300 bg-opacity-70 backdrop-filter backdrop-blur-3xl rounded-3xl focus:outline-none text-white pl-6 pt-6"></textarea>
            </div>
            <button class="w-32 h-24 bg-blue-400" @click="uploadComment">确定</button>
          </div>
        </section>
      </section>

  </div>
</template>

<script>
import detailSwiper from "~/components/detailSwiper";
import pagination from "@/components/pagination";
import {mapState} from 'vuex'
import { format } from 'date-fns'

export default {
  name: "detail",
  props: ['detailData'],
  components: {
    detailSwiper,
    pagination
  },
  data() {
    return {
      cur: 1,
      limit: 5,
      commentList: [],
      total: null,
      continueNum: 3,
      comment: null
    }
  },
  computed: {
    ...mapState({
      userInfo: state => state.userInfo,
      token: state => state.token
    }),
    applauseRate() {
      const rate = this.detailData.positiveNum / (this.detailData.positiveNum + this.detailData.negativeNum) * 100
      return rate.toFixed(2) + '%'
    }
  },
  created() {
    this.getPageData()
  },
  methods: {
    formatDateTime(time) {
      const commentTime = format(new Date(time), 'yyyy-MM-dd HH:mm:ss')
      return commentTime
    },
    changePage(page) {
      this.cur = page
      this.getPageData()
    },
    async getPageData() {
      let res = await this.$axios.get(`/comment/${this.$route.params.id}/${this.cur}/${this.limit}`)
      this.commentList = res.data.CommentDetailList
      this.total = res.data.commentNum
    },
    async uploadComment() {
      const data = {
        comment: this.comment,
        markId: this.$route.params.id,
        touristId: this.userInfo.id
      }
      let res = await this.$axios.post('/addComment', data)
      console.log(res)
      if (res.code === 20000) {
        this.$message.success('添加评论成功')
        this.comment = null
      } else {
        this.$message.error('添加评论失败')
      }
    }
  }
}
</script>

<style scoped>
.detail-container{
  background-image: url("/bg1.webp");
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
}
.detail-container::before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.2);
  pointer-events: none;
}

.info-container::after{
  content: "";
  display: block;
  clear: both;
}
</style>
