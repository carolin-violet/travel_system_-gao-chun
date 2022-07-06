<template>
  <div class="w-full h-auto">

<!--    订单表格-->
    <el-table
      :data="feedbackList"
      border
      fit
      style="width: 100%">
      <el-table-column
        label="发布时间"
        align="center"
        width="200">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.time }}</span>
        </template>
      </el-table-column>
      <el-table-column
        prop="content"
        label="游记内容"
        align="center"
        show-overflow-tooltip>
      </el-table-column>
      <el-table-column
        label="照片"
        align="center"
        width="80">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.photos[0]"
            :preview-src-list="scope.row.photos"
            lazy="lazy">
            <div slot="placeholder" class="image-slot">
              <img src="/loading.gif" alt="">
            </div>
          </el-image>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="160">
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
import {mapState} from "vuex";

export default {
  name: "feedback",
  data() {
    return {
      feedbackList: [],
      current: 1,
      limit: 5,
      total: 0
    }
  },

  computed: {
    ...mapState({
      userInfo: state => state.userInfo
    })
  },

  watch: {
    userInfo(newVal, oldVal) {
      this.getPageFeedback()
    }
  },

  created() {
    this.getPageFeedback()
  },

  methods: {
    async getPageFeedback() {
      let res = await this.$axios.get(`feedback/${this.current}/${this.limit}/${this.userInfo.id}`)
      this.feedbackList = res.data.items.map(item => {
        item.photos = item.photos.map(photo => {
          return photo.picture
        })
        return item
      })

      this.total = res.data.total
    },

    handleDelete(index ,row) {
      this.$confirm(`此操作将永久删除反馈${row.id}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        console.log('asgfsdgdgf')
        let res = await this.$axios.delete(`/delFeedback/${row.id}`)
        console.log(res)
        if (res.code == 20000) {
          this.getPageFeedback()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      }).catch((err) => {
        console.log(err)
        this.$message.info("已取消删除")
      });
    },

    handleCurrentChange(val) {
      this.current = val
      this.getPageFeedback()
    },

  }
}
</script>

<style scoped>

</style>
