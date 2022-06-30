<template>
  <div class="w-full h-full px-96 pt-8">
    <el-form label-width="80px" :model="curInfo">
      <el-form-item label="游客昵称">
        <el-input v-model="curInfo.nickName"></el-input>
      </el-form-item>
      <el-form-item label="游客电话">
        <el-input v-model="curInfo.telephone"></el-input>
      </el-form-item>
      <el-form-item label="游客邮箱">
        <el-input v-model="curInfo.email"></el-input>
      </el-form-item>
      <el-form-item class="text-center">
        <el-button type="primary" @click="changeInfo">保存</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {mapState} from 'vuex'

export default {
  name: "userInfo",
  data () {
    return{
      curInfo: {},
    }
  },

  computed: {
    ...mapState({
      userInfo: state => state.userInfo
    })
  },

  // 由于v-model数据无法实时显示，我用上了watch和mounted一起修改curInfo数据，暂时没找到更好的解决方法

  watch: {
    userInfo(newVal, oldVal) {
      this.curInfo = {...newVal}
      delete this.curInfo.password
    }
  },

  mounted() {
    this.curInfo = {...this.userInfo}
    delete this.curInfo.password
  },

  methods: {
    async changeInfo() {
      console.log(this.curInfo)
      let res = await this.$axios.put('updateInfo', this.curInfo)
      if (res.code === 20000) {
        this.$message.success('修改信息成功,请重新登录')
        this.$store.commit('logout')
        this.$router.push('/login')
      } else {
        this.$message.error('修改信息失败')
      }
    }
  }
}
</script>

<style scoped>

</style>
