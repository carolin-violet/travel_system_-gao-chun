<template>
  <div class="app-container">
    <el-button type="primary" @click="updateSentiment" :loading="loading">更新情感倾向</el-button>
    <span>(百度api限制了一次只能更新2条未进行情感分析的数据,英文可能不太正确)</span>

    <!--   展示表格 -->
    <el-table
      :data="commentList"
      stripe
      border
      fit
      lazy
      style="width: 100%">
      <el-table-column
        type="index"
        :index="calcIndex"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="id"
        label="评论id"
        align="center"
        width="200">
      </el-table-column>
      <el-table-column
        prop="markId"
        label="标志id"
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
        prop="comment"
        label="评论内容"
        align="center"
        show-overflow-tooltip
        width="480">
      </el-table-column>
      <el-table-column
        prop="sentiment"
        label="情感倾向"
        align="center"
        show-overflow-tooltip
        width="150">
        <template slot-scope="scope">
          <el-tag
            :type="scope.row.sentiment | sentimentFilter"
            disable-transitions>{{ scope.row.sentiment | sentimentNameFilter }}</el-tag>
        </template>
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
import comment from "@/api/comment";

export default {
  name: "Comment",
  filters: {
    sentimentFilter(sentiment) {
      const sentimentMap = {
        2: 'success',
        0: 'danger',
        null: 'info'
      }
      return sentimentMap[sentiment]
    },
    sentimentNameFilter(sentiment) {
      const sentimentNameMap = {
        2: '好评',
        0: '差评',
        null: '未进行分析'
      }
      return sentimentNameMap[sentiment]
    }
  },
  data () {
    return {
      commentList: [],
      current: 1,
      limit: 10,
      total: null,
      loading: false
    }
  },

  created() {
    this.getPageComment()
  },

  methods: {
    // 调用接口获取所有评论信息
    async getPageComment() {
      let res = await comment.getPageComment(this.current, this.limit)
      this.commentList = res.data.rows
      this.total = res.data.total
    },

    // 调用接口根据id删除评论
    removeComment(data) {
      this.$confirm(`此操作将永久删除评论${data.id}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await comment.removeComment(data.id)
        console.log(res)
        if (res.code == 20000) {
          this.getPageComment()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      }).catch(() => {
        this.$message.info("已取消删除")
      });
    },

    // 跟新情感倾向
    async updateSentiment() {
      this.loading = true
      let res = await comment.updateSentiment()
      this.loading = false
      console.log(res)
      if (res.code == 20000) {
        this.$message.success("更新成功")
        this.getPageComment()
      } else {
        this.$message.error("更新失败")
      }
    },

    // 删除按钮
    handleDelete(index, row) {
      this.removeComment(row)
    },

    // 处理分页器分页
    handleCurrentChange(val) {
      this.current = val
      this.getPageComment()
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    }
  }
}
</script>

<style scoped>

</style>
