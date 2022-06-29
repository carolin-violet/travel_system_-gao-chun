<template>
  <!--    主体内容-->
  <div class="relative detail-container w-screen h-auto pt-28 bg-black">
      <!--    上半部分介绍-->
      <section class="relative info-container w-full h-auto">
        <div class="float-left mx-48" style="width: 640px; height: 400px">
          <div class="bg-gray-100 w-full h-full flex justify-center items-center text-white text-6xl" v-if="!detailData.photosList">图片加载中...</div>
          <detail-swiper :photosList="detailData.photosList"/>
        </div>
        <div class="float-left text-3xl px-8 pt-6 bg-black bg-opacity-60 text-white" style="width: 900px; height: 400px">&nbsp;&nbsp;{{ detailData.description}}</div>
      </section>

      <!--      评论区-->
      <section class="relative w-full flex mt-3" style="height: 900px ">
<!--        评论展示-->
        <section class="flex-1 h-full">
<!--          用户评论-->
          <section class="w-11/12 h-5/6 space-y-10" v-if="total > 0">
            <div class="relative w-5/6 h-1/6 bg-purple-500 mx-auto text-black" v-for="comment in commentList" :key="comment.id">
              <div class="absolute w-48 h-full bg-yellow-300 space-y-2 text-center pt-3.5">
                <div class="w-12 h-12 mx-auto"><img src="/固城湖.webp" alt="" class="w-12 h-12 rounded-full"></div>
                <small class="block overflow-x-hidden">{{ comment.nickName }}</small>
                <br>
                <small class="block">{{ formatDateTime(comment.time) }}</small>
              </div>
              <div class="absolute relative w-4/5 h-full left-48 bg-gray-600 text-2xl pt-3.5">&nbsp;&nbsp;{{ comment.comment }}</div>
            </div>
          </section>
          <section class="w-11/12 h-5/6 space-y-10 text-4xl text-center text-white"  v-else>
            暂无评论
          </section>


<!--          分页器-->
          <section class="relative w-full h-1/6" v-show="total > 1">
            <div class="w-full h-32 mx-auto space-x-3 text-center pt-8">
              <pagination :cur="cur" :limit="limit" :total="total" :continueNum="continueNum" @changePage="changePage"/>
            </div>
          </section>
        </section>
<!--        写评论-->
        <section class="flex-1 h-full text-center pt-16">
          <div class="w-4/5 h-3/5 mx-auto text-4xl space-y-16">
            <div class="w-full h-auto text-left text-yellow-300 flex">
              <div class="w-1/2 mt-2 space-y-3">
                <strong class="text-6xl">￥ {{ detailData.discountPrice }}</strong>
                <strong class="line-through text-3xl text-gray-400 ml-6">￥{{ detailData.price }}</strong>
                <small class="block text-gray-400 text-xl">注：成年人全价,未成年人半价,老人、幼儿等免费,退伍军人、残疾人、学生、在职人员等持相关证明可免门票或半价购买门票</small>
              </div>
              <div class="cursor-pointer ml-36" @click="handleBook">
                <i class="iconfont icon-yuding text-6xl"></i>
                <strong class="text-6xl">点击预订</strong>
              </div>
            </div>
            <h2 class="text-left text-white" v-if="detailData.positiveNum > 0">好评率：{{ applauseRate }}</h2>
            <h3 class="text-white">尊敬的游客，您可以在下方发表您的意见</h3>
            <div class="w-full h-96">
              <textarea v-model="comment" cols="30" rows="10" class="w-full h-full bg-indigo-300 bg-opacity-70 backdrop-filter backdrop-blur-3xl rounded-3xl focus:outline-none text-white pl-6 pt-6"></textarea>
            </div>
            <button class="relative w-56 h-24 bg-indigo-300 rounded-3xl text-white" @click="uploadComment">确定</button>
          </div>
        </section>
      </section>


    <!--   预购表单 -->
    <el-dialog title="订单信息" :visible.sync="dialogFormVisible">
      <el-form :model="curOrder">
        <el-form-item label="预约时间" :label-width="formLabelWidth">
          <el-date-picker
            v-model="curOrder.appointmentTime"
            value-format="yyyy-MM-dd"
            placeholder="选择日期"
            :picker-options="pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预约人姓名" :label-width="formLabelWidth">
          <el-input v-model="curOrder.name"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="预约人联系方式" :label-width="formLabelWidth">
          <el-input v-model="curOrder.phone"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="成年人数" :label-width="formLabelWidth">
          <el-input-number v-model="curOrder.adult" @change="changeAmount" :min="0" :max="50"></el-input-number>
        </el-form-item>
        <el-form-item label="未成年人数" :label-width="formLabelWidth">
          <el-input-number v-model="curOrder.child" @change="changeAmount" :min="0" :max="50"></el-input-number>
        </el-form-item>
        <el-form-item>
          总金额: {{ curOrder.amount }}
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handlePay">跳转支付</el-button>
      </div>
    </el-dialog>

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
      comment: null,
      loading: true,
      dialogFormVisible: false,
      formLabelWidth: "120px",
      curOrder: {
        adult: 0,
        child: 0,
        mark: 'scenic',
        amount: 0
      },
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24);
            picker.$emit('pick', date);
          }
        }, {
          text: '一周前',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }]
      },
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
    // 格式化日期
    formatDateTime(time) {
      const commentTime = format(new Date(time), 'yyyy-MM-dd HH:mm:ss')
      return commentTime
    },
    // 改变页码
    changePage(page) {
      this.cur = page
      this.getPageData()
    },
    // 获取一页评论
    async getPageData() {
      let res = await this.$axios.get(`/comment/${this.$route.params.id}/${this.cur}/${this.limit}`)
      this.commentList = res.data.CommentDetailList
      this.total = res.data.commentNum
    },
    // 添加评论
    async uploadComment() {
      const data = {
        comment: this.comment,
        markId: this.$route.params.id,
        touristId: this.userInfo.id
      }
      let res = await this.$axios.post('/addComment', data)
      if (res.code === 20000) {
        this.$message.success('添加评论成功')
        this.comment = null
        this.getPageData()
      } else {
        this.$message.error('添加评论失败')
      }
    },

    // 占位图片的添加与删除
    changeLoading() {
      this.loading = false
    },
    // 点击预订按钮
    handleBook() {
      this.curOrder.commodityId = this.$route.fullPath.split('/')[2]
      this.curOrder.touristId = this.userInfo.id
      this.dialogFormVisible = true
    },

    // 填好信息跳转支付
    handlePay() {
      console.log(this.curOrder)
    },

    // 人数变化就更新总金额
    changeAmount() {
      this.curOrder.amount = ((this.curOrder.adult + this.curOrder.child/2) * this.detailData.discountPrice).toFixed(2)
    }
  }
}
</script>

<style scoped>
.detail-container{
  background-image: url("@/assets/images/bg2.webp");
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
