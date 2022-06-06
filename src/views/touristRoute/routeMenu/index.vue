<template>
  <div class="app-container">

    <el-button
      size="small"
      type="primary"
      style="margin: 5px 20px"
      @click="handleAdd"><i class="el-icon-circle-plus-outline"></i>添加线路
    </el-button>

    <!--   展示表格 -->
    <el-table
      :data="routeList"
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
        label="线路id"
        align="center"
        width="200">
      </el-table-column>
      <el-table-column
        prop="title"
        label="线路标题"
        align="center"
        show-overflow-tooltip
        width="200">
      </el-table-column>
      <el-table-column
        prop="description"
        label="线路描述"
        align="center"
        show-overflow-tooltip
        width="400">
      </el-table-column>
      <el-table-column
        prop="reason"
        label="线路推荐原因"
        align="center"
        show-overflow-tooltip
        width="280">
      </el-table-column>
      <el-table-column
        label="添加时间"
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
            type="info"
            @click="handleEdit(scope.$index, scope.row)"><i class="el-icon-edit"></i>编辑</el-button>
          <el-button
            size="small"
            type="danger"
            style="margin: 0 10px"
            @click="handleDelete(scope.$index, scope.row)"><i class="el-icon-delete"></i>删除</el-button>
          <el-button
            size="small"
            type="success"
            @click="handleMoreSites(scope.$index, scope.row)">查看站点</el-button>
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

    <!--   添加删除用的表单 -->
    <el-dialog title="线路信息" :visible.sync="dialogFormVisible">
      <el-form :model="curRoute">
        <el-form-item label="线路id" :label-width="formLabelWidth" v-show="flag===0">
          <el-input v-model="curRoute.id" disabled autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="线路标题" :label-width="formLabelWidth">
          <el-input v-model="curRoute.title"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="线路描述" :label-width="formLabelWidth">
          <el-input
            v-model="curRoute.description"
            autocomplete="off"
            type="textarea"
            :rows="4"
            placeholder="请输入内容"></el-input>
        </el-form-item>
        <el-form-item label="线路推荐原因" :label-width="formLabelWidth">
          <el-input
            v-model="curRoute.reason"
            autocomplete="off"
            type="textarea"
            :rows="3"
            placeholder="请输入内容"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleModify">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import touristRoute from "@/api/touristRoute";

export default {
  name: "touristRoute",
  data () {
    return {
      routeList: [],
      dialogFormVisible: false,
      flag: null,
      curRoute: {},
      formLabelWidth: "120px",
      current: 1,
      limit: 10,
      total: null
    }
  },

  created() {
    this.getPageRoute()
  },

  methods: {
    // 调用接口获取所有线路信息
    async getPageRoute() {
      let res = await touristRoute.getPageRoute(this.current, this.limit)
      this.routeList = res.data.items
      this.total = res.data.total
    },

    // 调用接口添加线路信息
    async addRoute(data) {
      let res = await touristRoute.addRoute(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("添加成功")
        this.getPageRoute()
      } else {
        this.$message.error("添加失败")
      }
    },

    // 调用接口修改线路信息
    async updateRoute(data) {
      let res = await touristRoute.updateRoute(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("修改成功")
        this.getPageRoute()
      } else {
        this.$message.error("修改失败")
      }
    },

    // 调用接口根据id删除线路
    removeRoute(data) {
      this.$confirm(`此操作将永久删除${data.name}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await touristRoute.removeRoute(data.id)
        if (res.code == 20000) {
          this.getPageRoute()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      }).catch(() => {
        this.$message.info("已取消删除")
      });
    },

    // 编辑按钮
    handleEdit(index, row) {
      this.curRoute = Object.assign({}, row)
      this.flag = 0
      this.dialogFormVisible = true
    },

    // 删除按钮
    handleDelete(index, row) {
      this.removeRoute(row)
    },


    // 添加按钮
    handleAdd() {
      this.curRoute = {}
      this.flag = 1
      this.dialogFormVisible = true
    },

    // 确定按钮, flag为1就添加线路，为0就修改线路
    handleModify() {
      if (this.flag === 1) {
        this.addRoute(this.curRoute)
      } else {
        this.updateRoute(this.curRoute)
      }
    },

    // 查看站点详情按钮
    handleMoreSites(index, row) {
      this.$router.push({
        path: "/touristRoute/routeSites",
        query: {
          route_id: row.id
        }
      })
    },

    // 处理分页器分页
    handleCurrentChange(val) {
      this.current = val
      this.getPageRoute()
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    }

  },
}
</script>

<style scoped>

</style>
