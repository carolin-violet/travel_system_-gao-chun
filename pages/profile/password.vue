<template>
  <div class="w-full h-full px-96 pt-8">
    <el-form label-width="120px">
      <el-form-item label="请输入密码">
        <el-input v-model="password"></el-input>
      </el-form-item>
      <el-form-item label="再次确认密码">
        <el-input v-model="checkPassword"></el-input>
      </el-form-item>
      <el-form-item class="text-center">
        <el-button type="primary" @click="changeInfo">保存</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {mapState} from "vuex";

export default {
  name: "password",
  data () {
    return{
      curInfo: {},
      password: null,
      checkPassword: null
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
    }
  },

  mounted() {
    this.curInfo = {...this.userInfo}
  },

  methods: {
    async changeInfo() {
      if (this.password === this.checkPassword) {
        this.curInfo.password = this.password
        let res = await this.$axios.put('updateInfo', this.curInfo)
        if (res.code === 20000) {
          this.$message.success('修改密码成功,请重新登录')
          this.$store.commit('logout')
          this.$router.push('/login')
        } else {
          this.$message.error('修改密码失败')
        }
      } else {
        this.$message.error("密码不一致")
      }
    }
  }
}
</script>

<style scoped>

</style>
