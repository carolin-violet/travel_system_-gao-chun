<template>
  <!--  注册页面-->
  <div class="register-container relative w-screen h-screen z-20">
    <!--    登录框-->
    <section class="login-form absolute z-10 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-1/3 h-2/3 text-center space-y-4 text-4xl pt-24 text-indigo-300">
      <div class=" w-1/2 h-20 mx-auto">
        <input type="text" placeholder="请输入昵称" v-model="registerForm.nickName" class=" w-full h-full 2xl:focus:placeholder-indigo-300 rounded-2xl bg-transparent border-2 border-indigo-200 focus:outline-none pl-12">
      </div>
      <div class=" w-1/2 h-20 mx-auto">
        <input type="text" placeholder="请输入密码" v-model="registerForm.password" class=" w-full h-full 2xl:focus:placeholder-indigo-300 rounded-2xl bg-transparent border-2 border-indigo-200 focus:outline-none pl-12">
      </div>
      <div class=" w-1/2 h-20 mx-auto">
        <input type="text" placeholder="请输入邮箱" v-model="registerForm.email" class=" w-full h-full 2xl:focus:placeholder-indigo-300 rounded-2xl bg-transparent border-2 border-indigo-200 focus:outline-none pl-12">
      </div>
      <div class=" w-1/2 h-20 mx-auto">
        <input type="text" placeholder="请输入手机号" v-model="registerForm.telephone" class=" w-full h-full 2xl:focus:placeholder-indigo-300 rounded-2xl bg-transparent border-2 border-indigo-200 focus:outline-none pl-12">
      </div>
      <div class="w-1/2 h-20 mx-auto flex space-x-5">
        <input type="text" placeholder="验证码" v-model="registerForm.code" class="block w-1/2 h-full 2xl:focus:placeholder-indigo-300 rounded-2xl bg-transparent border-2 border-indigo-200 focus:outline-none pl-12">
        <div class="w-1/2 h-20 text-3xl pt-4 cursor-pointer border-2 border-indigo-200 rounded-2xl" @click="getCode">获取验证码</div>
      </div>
      <button class="register-button w-1/5 h-28 rounded-2xl border-2 border-indigo-200" @click="handleRegister">点击注册</button>
    </section>

    <ul class="background">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>

    <img class="w-full h-full" src="@/assets/images/高淳老街.jpg" alt="">
  </div>
</template>

<script>
import {validateRegister} from "@/utils/validate";

export default {
  name: "register",
  data() {
    return {
      registerForm: {
        nickName: '',
        telephone: '',
        password: '',
        email: '',
        code: ''
      }
    }
  },
  methods: {
    async getCode() {

    },
    async handleRegister() {
      if (validateRegister(this.registerForm)) {
        let res = await this.$axios.post("/register", this.registerForm)
        if (res.code === 20000) {
          this.$message.success("注册成功")
          this.$router.push({
            path: '/login'
          })
        } else {
          this.$message.error("注册失败:" + res)
        }
      }
    }
  }
}
</script>

<style scoped>
/*毛玻璃特效*/
.login-form{
  background: rgba( 255, 255, 255, 0.2 );
  box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
  backdrop-filter: blur( 20px );
  -webkit-backdrop-filter: blur( 8px );
  border-radius: 10px;
  border: 1px solid rgba( 255, 255, 255, 0.18 );
}

.register-container::before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.2);
}


.register-button{
  transform: scale(0.98);
}


/*背景滑块*/
@keyframes animate {
  0%{
    transform: translateY(0) rotate(0deg);
    opacity: 1;
    border-radius: 0;
  }
  100%{
    transform: translateY(-1000px) rotate(720deg);
    opacity: 0;
    border-radius: 50%;
  }
}

.background {
  position: fixed;
  width: 100vw;
  height: 100vh;
  top: 0;
  left: 0;
  margin: 0;
  padding: 0;
  overflow: hidden;
}
.background li {
  position: absolute;
  display: block;
  list-style: none;
  width: 20px;
  height: 20px;
  background: rgba(255, 255, 255, 0.2);
  animation: animate 19s linear infinite;
}

.background li:nth-child(0) {
  left: 5%;
  width: 126px;
  height: 126px;
  bottom: -126px;
  animation-delay: 1s;
}
.background li:nth-child(1) {
  left: 59%;
  width: 111px;
  height: 111px;
  bottom: -111px;
  animation-delay: 2s;
}
.background li:nth-child(2) {
  left: 47%;
  width: 157px;
  height: 157px;
  bottom: -157px;
  animation-delay: 2s;
}
.background li:nth-child(3) {
  left: 62%;
  width: 195px;
  height: 195px;
  bottom: -195px;
  animation-delay: 5s;
}
.background li:nth-child(4) {
  left: 63%;
  width: 104px;
  height: 104px;
  bottom: -104px;
  animation-delay: 2s;
}
.background li:nth-child(5) {
  left: 88%;
  width: 159px;
  height: 159px;
  bottom: -159px;
  animation-delay: 11s;
}
.background li:nth-child(6) {
  left: 22%;
  width: 179px;
  height: 179px;
  bottom: -179px;
  animation-delay: 17s;
}
.background li:nth-child(7) {
  left: 35%;
  width: 114px;
  height: 114px;
  bottom: -114px;
  animation-delay: 8s;
}
.background li:nth-child(8) {
  left: 77%;
  width: 178px;
  height: 178px;
  bottom: -178px;
  animation-delay: 27s;
}
.background li:nth-child(9) {
  left: 10%;
  width: 130px;
  height: 130px;
  bottom: -130px;
  animation-delay: 25s;
}

</style>
