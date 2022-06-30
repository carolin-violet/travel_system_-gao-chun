<template>
  <div class="order-container">
    <el-row style="margin: 20px 20px" :gutter="20">
      <el-col :span="8">
        <el-date-picker
          v-model="orderVo.date"
          value-format="yyyy-MM-dd"
          placeholder="选择日期"
          :picker-options="pickerOptions">
        </el-date-picker>
      </el-col>
      <el-col :span="8">
        <el-radio-group v-model="orderVo.mark">
          <el-radio label="scenic" border>门票订单</el-radio>
          <el-radio label="route" border>拼团订单</el-radio>
        </el-radio-group>
      </el-col>
      <el-col :span="8">
        <el-button type="success" @click="resetCondition">重置</el-button>
        <el-button type="primary" @click="getPageOrder" style="margin-left: 30px">确定</el-button>
      </el-col>
    </el-row>

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
        :index="calcIndex"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="id"
        label="订单id"
        align="center"
        width="100">
      </el-table-column>
      <el-table-column
        prop="commodityId"
        label="商品id"
        align="center"
        width="100">
      </el-table-column>
      <el-table-column
        prop="touristId"
        label="游客id"
        align="center"
        width="100">
      </el-table-column>
      <el-table-column
        label="预约时间"
        align="center"
        width="120">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.appointmentTime.split(' ')[0] }}</span>
        </template>
      </el-table-column>
      <el-table-column
        prop="phone"
        label="预留电话"
        align="center"
        width="120">
      </el-table-column>
      <el-table-column
        prop="name"
        label="预约人姓名"
        align="center"
        width="150">
      </el-table-column>
      <el-table-column
        prop="adult"
        label="成年人数"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="child"
        label="未成年人数"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="amount"
        label="总金额"
        align="center"
        width="100">
      </el-table-column>
      <el-table-column
        label="是否支付"
        align="center"
        width="100">
        <template slot-scope="scope">
          <el-tag
            :type="scope.row.isPaid | paidFilter"
            disable-transitions>{{ scope.row.isPaid | paidNameFilter }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="订单生成时间"
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


    <!--   修改用的表单 -->
    <el-dialog title="订单信息" :visible.sync="dialogFormVisible">
      <el-form :model="curOrder">
        <el-form-item label="订单id" :label-width="formLabelWidth">
          <el-input v-model="curOrder.id" disabled autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="商品id" :label-width="formLabelWidth">
          <el-input v-model="curOrder.commodityId" disabled  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="游客id" :label-width="formLabelWidth">
          <el-input v-model="curOrder.touristId" disabled autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="预约时间" :label-width="formLabelWidth">
          <el-date-picker
            v-model="curOrder.appointmentTime"
            align="left"
            value-format="yyyy-MM-dd"
            placeholder="选择日期"
            :picker-options="pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预约人姓名" :label-width="formLabelWidth">
          <el-input v-model="curOrder.name"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="预约人联系方式" :label-width="formLabelWidth">
          <el-input v-model="curOrder.phone"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="成年人数" :label-width="formLabelWidth">
          <el-input v-model="curOrder.adult"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="未成年人数" :label-width="formLabelWidth">
          <el-input v-model="curOrder.child"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="总金额" :label-width="formLabelWidth">
          <el-input v-model="curOrder.amount"  autocomplete="off"></el-input>
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
import order from "@/api/order";

export default {
  name: "Ticket",
  filters: {
    paidFilter(paid) {
      const paidMap = {
        1: 'success',
        0: 'danger'
      }
      return paidMap[paid]
    },
    paidNameFilter(paid) {
      const paidNameMap = {
        1: '已支付',
        0: '未支付'
      }
      return paidNameMap[paid]
    }
  },
  data () {
    return {
      orderVo: {
        mark: null,
        date: null
      },
      orderList: [],
      total: null,
      current: 1,
      limit: 10,
      dialogFormVisible: false,
      formLabelWidth: "120px",
      curOrder: {},
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24);
            picker.$emit('pick', date);
          }
        }, {
          text: '一周前',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }]
      },
    }
  },

  created() {
    this.getPageOrder()
  },

  methods: {
    // 分页获取订单
    async getPageOrder() {
      let res = await order.getOrder( this.current, this.limit, this.orderVo)
      this.orderList = res.data.rows
      this.total = res.data.total
    },

    // 调用接口根据id删除评论
    removeOrder(data) {
      this.$confirm(`此操作将永久删除订单${data.id}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await order.removeOrder(data.id)
        if (res.code == 20000) {
          this.getPageOrder()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      }).catch(() => {
        this.$message.info("已取消删除")
      });
    },

    // 调用接口修改线路信息
    async updateOrder(data) {
      let res = await order.updateOrder(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("修改成功")
        this.getPageOrder()
      } else {
        this.$message.error("修改失败")
      }
    },

    // 删除按钮
    handleDelete(index, row) {
      this.removeOrder(row)
    },

    // 编辑按钮
    handleEdit(index, row) {
      this.curOrder = Object.assign({}, row)
      this.dialogFormVisible = true
    },

    // 修改数据信息
    handleModify() {
      this.updateOrder(this.curOrder)
    },

    handleCurrentChange() {
      this.getPageOrder()
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    },

    resetCondition() {
      this.orderVo.mark = null
      this.orderVo.date = null
    }
  }
}
</script>

<style scoped>

</style>
