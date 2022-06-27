<template>
  <div class="order-container">
    <!--   展示表格 -->
    <el-table
      :data="orderList"
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
import order from "@/api/order";

export default {
  name: "Ticket",
  data () {
    return {
      orderList: [],
      total: null,
      current: 1,
      limit: 10,
      date: "2022-06-28"
    }
  },
  created() {
    this.getPageOrder()
  },
  methods: {
    async getPageOrder() {
      let res = await order.getOrder("scenic", this.current, this.limit, this.date || null)
      console.log(res)
    },

    handleCurrentChange() {
      this.getPageOrder()
    }
  }
}
</script>

<style scoped>

</style>
