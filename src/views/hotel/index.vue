<template>
  <div class="app-container">

    <el-button
      size="small"
      type="primary"
      style="margin: 5px 20px"
      @click="handleAdd"><i class="el-icon-circle-plus-outline"></i>添加旅馆
    </el-button>

    <!--   展示表格 -->
    <el-table
      :data="hotelList"
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
        label="旅馆id"
        align="center"
        width="200">
      </el-table-column>
      <el-table-column
        prop="name"
        label="旅馆名称"
        align="center"
        show-overflow-tooltip
        width="200">
      </el-table-column>
      <el-table-column
        label="旅馆图片"
        align="center"
        width="280">
        <template slot-scope="scope">
          <el-image
            style="width: 100px; height: 100px"
            :src="scope.row.picture"
            :preview-src-list="[scope.row.picture]">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column
        prop="description"
        label="旅馆描述"
        align="center"
        show-overflow-tooltip
        width="280">
      </el-table-column>
      <el-table-column
        prop="popular"
        label="优先级"
        align="center"
        width="100">
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
            @click="handleMorePictures(scope.$index, scope.row)">查看更多图片</el-button>
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
    <el-dialog title="旅馆信息" :visible.sync="dialogFormVisible">
      <el-form
        :model="curHotel"
        v-loading="loading"
        element-loading-text="图片跟新中"
        element-loading-spinner="el-icon-loading"
        element-loading-background="rgba(255, 255, 255, 0.2)"
      >
        <el-form-item label="旅馆id" :label-width="formLabelWidth" v-show="flag===0">
          <el-input v-model="curHotel.id" disabled autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="旅馆名称" :label-width="formLabelWidth">
          <el-input v-model="curHotel.name"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="旅馆图片" :label-width="formLabelWidth">
<!--          -->
          <el-upload
            :action="BASE_API + '/travel_system/oss/picture'"
            list-type="picture-card"
            :limit="1*1"
            :before-upload="handleBeforeUpload"
            :on-success="handleUploadSuccess"
            :on-progress="handleLoading"
            >
            <i slot="default" class="el-icon-plus"></i>
            <div slot="file" slot-scope="{file}">
              <img
                class="el-upload-list__item-thumbnail"
                :src="file.url" alt=""
              >
              <span class="el-upload-list__item-actions">
        <span
          class="el-upload-list__item-preview"
          @click="handlePictureCardPreview(file)"
        >
          <i class="el-icon-zoom-in"></i>
        </span>
      </span>
            </div>
          </el-upload>
<!--          -->
        </el-form-item>
        <el-form-item label="旅馆描述" :label-width="formLabelWidth">
          <el-input
            v-model="curHotel.description"
            autocomplete="off"
            type="textarea"
            :rows="4"
            placeholder="请输入内容"></el-input>
        </el-form-item>
        <el-form-item label="旅馆优先级" :label-width="formLabelWidth">
          <el-input v-model="curHotel.popular"  autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleModify">确 定</el-button>
      </div>

      <el-dialog :visible.sync="dialogVisible">
        <img width="100%" :src="dialogImageUrl" alt="">
      </el-dialog>

    </el-dialog>
  </div>
</template>

<script>
import hotel from "@/api/hotel";

export default {
  name: "hotelMenu",
  data () {
    return {
      hotelList: [],
      dialogFormVisible: false,
      flag: null,
      curHotel: {},
      formLabelWidth: "120px",
      dialogImageUrl: '',
      dialogVisible: false,
      disabled: false,
      current: 1,
      limit: 5,
      total: null,
      BASE_API: process.env.VUE_APP_BASE_API,
      loading: false
    }
  },

  created() {
    this.getPageHotel()
  },

  methods: {
    // 调用接口获取所有旅馆信息
    async getPageHotel() {
      let res = await hotel.getPageHotel(this.current, this.limit)
      this.hotelList = res.data.items
      this.total = res.data.total
    },

    // 调用接口添加旅馆信息
    async addHotel(data) {
      let res = await hotel.addHotel(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("添加成功")
        this.getPageHotel()
        this.curHotel = {}
        this.dialogImageUrl = ''
      } else {
        this.$message.error("添加失败")
      }
    },

    // 调用接口修改旅馆信息
    async updateHotel(data) {
      let res = await hotel.updateHotel(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("修改成功")
        this.getPageHotel()
        this.dialogImageUrl = ''
        this.curHotel = {}
      } else {
        this.$message.error("修改失败")
      }
    },

    // 调用接口根据id删除旅馆
    removeHotel(data) {
      this.$confirm(`此操作将永久删除${data.name}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await hotel.removeHotel(data.id)
        if (res.code == 20000) {
          this.getPageHotel()
          this.dialogImageUrl = ''
          this.curHotel = {}
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
      this.curHotel = Object.assign({}, row)
      this.flag = 0
      this.dialogFormVisible = true
    },

    // 删除按钮
    handleDelete(index, row) {
      this.removeHotel(row)
    },

    // 查看更多图片按钮
    handleMorePictures(index, row) {
      this.$router.push({
        path: "/pictures/uploadPictures",
        query: {
          mark_id: row.id   // 传入旅馆id
        }
      })
    },

    // 添加按钮
    handleAdd() {
      this.curHotel = {}
      this.flag = 1
      this.dialogFormVisible = true
    },

    // 确定按钮, flag为1就添加旅馆，为0就修改旅馆
    handleModify() {
      if (this.flag === 1) {
        this.addHotel(this.curHotel)
      } else {
        this.updateHotel(this.curHotel)
      }
    },

    // 放大图片
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },

    // 图片上传成功
    handleUploadSuccess(res, file) {
      this.$message.success("图片上传成功")
      this.dialogImageUrl = res.data.url
      this.curHotel.picture = res.data.url
      this.loading = false
    },
    // 图片上传前校验
    handleBeforeUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isPng = file.type === 'image/png';
      const isWebp = file.type === 'image/webp';
      const isLt30M = file.size / 1024 / 1024 < 30;

      if (!isJPG && !isPng && !isWebp) {
        this.$message.error('上传头像图片只能是 JPG或PNG或WEBP 格式!');
      }

      if (!isLt30M) {
        this.$message.error('上传图片大小不能超过 30MB!');
      }
      return isJPG || isPng || isWebp && isLt30M;
    },

    // 文件上传时的钩子，使得表单显示加载中不可点击
    handleLoading(event, file, fileList) {
      this.loading = true
    },

    // 处理分页器分页
    handleCurrentChange(val) {
      this.current = val
      this.getPageHotel()
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    }
  }
}
</script>

<style scoped>

</style>
