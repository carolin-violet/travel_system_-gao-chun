<template>
  <div class="dashboard-container">
    <panel-group></panel-group>
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card>
          <baseCount style="height: 350px"/>
        </el-card>
      </el-col>
      <el-col :span="10">
        <el-card>
          <comment style="height: 350px"/>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <is-paid style="height: 350px"/>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" style="margin-top: 40px; margin-bottom: 30px">
      <el-col :span="18">
        <el-card>
          <income style="height: 350px"/>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <scenic-and-route style="height: 350px"/>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import panelGroup from './panelGroup'
import baseCount from "@/views/dashboard/charts/baseCount";
import comment from "@/views/dashboard/charts/comment";
import income from "@/views/dashboard/charts/income";
import isPaid from "@/views/dashboard/charts/isPaid";
import scenicAndRoute from "@/views/dashboard/charts/scenicAndRoute";

export default {
  name: 'Dashboard',
  components: {
    panelGroup,
    baseCount,
    comment,
    income,
    isPaid,
    scenicAndRoute
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  }
}
</script>

<style lang="scss" scoped>
.dashboard-container{
  width: 100%;
  min-height: 100vh;
  background-color: #f0f2f5;
  padding: 0 20px 0 20px;
}

</style>
