<template>
  <div class="manager-container">
    <el-button
      size="small"
      type="primary"
      style="margin: 5px 20px"
      @click="handleAdd"><i class="el-icon-circle-plus-outline"></i>添加管理员
    </el-button>

<!--   展示表格 -->
    <el-table
      :data="managerList"
      stripe
      border
      fit
      lazy
      style="width: 100%">
      <el-table-column
        type="index"
        width="50">
      </el-table-column>
      <el-table-column
        prop="id"
        label="用户id"
        align="center"
        width="280">
      </el-table-column>
      <el-table-column
        label="姓名"
        align="center"
        width="280">
        <template slot-scope="scope">
          <el-tag>{{ scope.row.name }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="telephone"
        label="手机号"
        align="center"
        width="280">
      </el-table-column>
      <el-table-column
        label="注册时间"
        align="center"
        width="280">
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
            style="margin: 0 20px"
            @click="handleDelete(scope.$index, scope.row)"><i class="el-icon-delete"></i>删除</el-button>
          <el-button
            size="small"
            type="warning"
            @click="handlePermission(scope.$index, scope.row)">查看权限</el-button>
        </template>
      </el-table-column>
    </el-table>

<!--   添加删除用的表单 -->
    <el-dialog title="管理员信息" :visible.sync="dialogFormVisible">
      <el-form :model="curManager">
        <el-form-item label="用户id" :label-width="formLabelWidth" v-show="flag===0">
          <el-input v-model="curManager.id" disabled autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input v-model="curManager.name"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号" :label-width="formLabelWidth">
          <el-input v-model="curManager.telephone"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" :label-width="formLabelWidth">
          <el-input v-model="curManager.password"  autocomplete="off"></el-input>
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
import manager from "@/api/manager";

export default {
  name: "ManagerMenu",
  data() {
    return {
      managerList: [],
      dialogFormVisible: false,
      formLabelWidth: "120px",
      curManager: {},
      flag: null   // 用于区分是添加操作还是修改操作,1为添加0为修改
    }
  },
  created() {
    this.getAllManager()
  },
  methods: {
    // 调用接口获取所有管理员信息
    async getAllManager() {
      let res = await manager.getAllManager()
      this.managerList = res.data.items
    },

    // 调用接口添加管理员
    async addManager(data) {
      let res = await manager.addManager(data)
      if (res.code == 20000) {
        this.getAllManager()
        this.$message.success("添加成功")
      } else {
        this.$message.error("添加失败")
      }
    },

    // 调用接口修改管理员信息
    async updateManager(data) {
      let res = await manager.updateManager(data)
      if (res.code == 20000) {
        this.getAllManager()
        this.$message.success("修改成功")
      } else {
        this.$message.error("修改失败")
      }
    },

    // 调用接口删除管理员
    delManager(data) {
      this.$confirm(`此操作将永久删除${data.name}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await manager.removeManager(data.id)
        if (res.code == 20000) {
          this.getAllManager()
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
      this.curManager = Object.assign({}, row)
      this.flag = 0
      this.dialogFormVisible = true
    },

    // 删除按钮
    handleDelete(index, row) {
      this.delManager(row)
    },

    // 查看权限按钮
    handlePermission(index, row) {
      this.$router.push({
        path: "/user/permission",
        query: {
          id: row.id
        }
      })
    },

    // 添加按钮
    handleAdd() {
      this.curManager = {}
      this.flag = 1
      this.dialogFormVisible = true
    },

    // 添加或删除管理员
    handleModify() {
      if (this.flag === 1) {
        this.addManager(this.curManager)
      } else {
        this.updateManager(this.curManager)
      }
      this.dialogFormVisible = false
    }
  }
}
</script>

<style scoped>

</style>
