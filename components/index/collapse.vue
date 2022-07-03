<template>
<!--  一个折叠面板-->
  <div class="w-full h-auto shadow-2xl">
<!--    显示部分-->
    <section class="w-full h-36 p-3 bg-white text-3xl space-x-16 transition-all duration-500 hover:bg-indigo-400 transform hover:scale-y-105 hover:text-white" @click="route.showContent = !route.showContent">
      <div class="route-title relative float-left w-1/4 h-full pt-4 pl-4">
        <span>{{route.title}}</span>
      </div>
      <div class="float-left w-2/3 h-full pt-4">
        <span>{{route.description}}</span>
      </div>
    </section>
<!--    隐藏部分-->
    <section class="hidden-content w-full h-auto p-6 bg-white rounded-b-xl pb-6 pl-4 pt-4" v-show="route.showContent">
      <section class="text-3xl mb-8">
        <strong>推荐理由:</strong>
        <p class="tracking-widest" style="text-indent: 2em">{{ route.reason }}</p>
      </section>
<!--      站点信息列表-->
      <strong class="text-3xl">行程安排：</strong>
      <section v-for="site in route.siteList" :key="site.sort" class="space-y-3">
        <div class="space-x-5 text-3xl">
          <i class="iconfont icon-flag text-4xl"></i>
          <span>{{site.site}}</span>
          <span>{{site.startTime}}—{{site.endTime}}</span>
        </div>
        <div class="w-4/5 ml-16 text-2xl">详情：{{site.description}}</div>
      </section>
<!--      购买-->
      <section>
        <strong class="text-3xl">拼团：</strong>
        <div class="w-full h-auto text-left text-yellow-300 flex">
          <div class="w-1/2 mt-2 space-y-3">
            <strong class="text-6xl">￥ {{ route.discountPrice }}</strong>
            <strong class="line-through text-3xl text-gray-400 ml-6">￥{{ route.price }}</strong>
            <small class="block text-gray-400 text-xl">注：成年人全价,未成年人半价,老人、幼儿等免费,退伍军人、残疾人、学生、在职人员等无需预购持相关证明可免费进入</small>
          </div>
          <div class="cursor-pointer ml-36" @click="handleBook">
            <i class="iconfont icon-yuding text-6xl"></i>
            <strong class="text-6xl">点击预订</strong>
          </div>
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
        <el-button type="primary" @click="handlePay" :loading="loading">跳转支付</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {mapState} from 'vuex'

export default {
  name: "collapse",
  props: ['route'],
  data() {
    return {
      loading: false,
      dialogFormVisible: false,
      formLabelWidth: "120px",
      curOrder: {
        adult: 0,
        child: 0,
        mark: 'route',
        amount: 0,
        isPaid: 0
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
  },

  methods: {
    // 点击预订按钮
    handleBook() {
      this.curOrder.commodityId = this.route.id
      this.curOrder.touristId = this.userInfo.id
      this.dialogFormVisible = true
    },

    // 提交订单信息并跳转支付
    async handlePay() {
      console.log(this.curOrder)
      this.loading = true
      let res = await this.$axios.post('/addOrder',this.curOrder)
      if (res.code === 20000) {
        this.$router.push('/shoppingCart')
      } else {
        this.$message.error('创建订单失败')
      }
      this.loading = false
    },

    // 人数变化就更新总金额
    changeAmount() {
      this.curOrder.amount = ((this.curOrder.adult + this.curOrder.child/2) * this.route.discountPrice).toFixed(2)
    }
  }
}
</script>

<style scoped>

.route-title::after{
  content: "";
  position: absolute;
  top: 50%;
  right: 0;
  width: 3px;
  height: 80%;
  transform: translateY(-50%);
  background-color: #a5b4fc;
}

.hidden-content{
  border-top: 1px solid #a5b4fc;
}
</style>
