<template>
  <div class="app-container">

    <!--   展示表格 -->
    <el-table
      :data="touristList"
      stripe
      border
      fit
      lazy
      style="width: 100%">
      <el-table-column
        type="index"
        :index="calcIndex"
        width="50">
      </el-table-column>
      <el-table-column
        prop="id"
        label="游客id"
        align="center"
        width="300">
      </el-table-column>
      <el-table-column
        prop="nickName"
        label="游客昵称"
        align="center"
        width="300">
      </el-table-column>
      <el-table-column
        prop="telephone"
        label="游客电话"
        align="center"
        width="300">
      </el-table-column>
      <el-table-column
        prop="email"
        label="游客邮箱"
        align="center"
        width="300">
      </el-table-column>
      <el-table-column
        label="注册时间"
        align="center"
        width="300">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.createTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button
            size="small"
            type="danger"
            style="margin: 0 20px"
            @click="handleDelete(scope.$index, scope.row)"><i class="el-icon-delete"></i>删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!--    分页器-->
    <el-pagination
      background
      @current-change="handleCurrentChange"
      :current-page="current"
      layout="prev, pager, next, total"
      :page-size="limit"
      :total="total">
    </el-pagination>

  </div>
</template>

<script>
import tourist from "@/api/tourist";

export default {
  name: "Tourist",
  data () {
    return {
      touristList: [],
      current: 1,
      limit: 10,
      total: null
    }
  },

  created() {
    this.getPageTourist()
  },

  methods: {
    // 调用接口获取所有游客信息
    async getPageTourist() {
      let res = await tourist.getPageTourist(this.current, this.limit)
      this.touristList = res.data.rows
      this.total = res.data.total
    },

    // 调用接口根据id删除游客
    removeTourist(data) {
      this.$confirm(`此操作将永久删除游客${data.id}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        console.log(data)
        let res = await tourist.removeTourist(data.id)
        if (res.code == 20000) {
          this.getPageTourist()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      }).catch(() => {
        this.$message.info("已取消删除")
      });
    },

    // 删除按钮
    handleDelete(index, row) {
      this.removeTourist(row)
    },

    // 处理分页器分页
    handleCurrentChange(val) {
      this.current = val
      this.getPageTourist()
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    }
  }
}
</script>

<style scoped>

</style>
