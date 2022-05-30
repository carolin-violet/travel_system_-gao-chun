<template>
  <div class="app-container">

    <!--   展示表格 -->
    <el-table
      :data="noteList"
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
        label="反馈id"
        align="center"
        width="200">
      </el-table-column>
      <el-table-column
        prop="touristId"
        label="游客id"
        align="center"
        width="200">
      </el-table-column>
      <el-table-column
        label="发布时间"
        align="center"
        width="200">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.createTime }}</span>
        </template>
      </el-table-column>
      <el-table-column
        prop="content"
        label="反馈内容"
        align="center"
        show-overflow-tooltip
        width="480">
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button
            size="small"
            type="success"
            @click="handleMorePictures(scope.$index, scope.row)">查看更多图片</el-button>
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
      :total="total">
    </el-pagination>

  </div>
</template>

<script>
import feedback from "@/api/feedback";

export default {
  name: "Feedback",
  data () {
    return {
      noteList: [],
      current: 1,
      limit: 10,
      total: null
    }
  },

  created() {
    this.getPageFeedback()
  },

  methods: {
    // 调用接口获取所有反馈信息
    async getPageFeedback() {
      let res = await feedback.getPageFeedback(this.current, this.limit)
      this.noteList = res.data.rows
      this.total = res.data.total
    },

    // 调用接口根据id删除反馈
    removeFeedback(data) {
      this.$confirm(`此操作将永久删除反馈${data.id}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await feedback.removeFeedback(data.id)
        if (res.code == 20000) {
          this.getPageFeedback()
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
      this.removeFeedback(row)
    },

    // 处理分页器分页
    handleCurrentChange(val) {
      this.current = val
      this.getPageFeedback()
    },

    // 查看图片详情
    handleMorePictures(index,row) {
      this.$router.push({
        path: "/pictures/uploadPictures",
        query: {
          mark_id: row.id   // 传入旅馆id
        }
      })
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    }
  }
}
</script>

<style scoped>

</style>
