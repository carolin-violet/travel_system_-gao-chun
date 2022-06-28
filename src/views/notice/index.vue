<template>
  <div class="app-container">

    <el-button
      size="small"
      type="primary"
      style="margin: 5px 20px"
      @click="handleAdd"><i class="el-icon-circle-plus-outline"></i>添加公告
    </el-button>

    <!--   展示表格 -->
    <el-table
      :data="noticeList"
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
        label="公告id"
        align="center"
        width="200">
      </el-table-column>
      <el-table-column
        prop="name"
        label="公告名称"
        align="center"
        show-overflow-tooltip
        width="280">
      </el-table-column>
      <el-table-column
        label="公告图片"
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
        label="公告描述"
        align="center"
        show-overflow-tooltip
        width="380">
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


    <!--   添加修改用的表单 -->
    <el-dialog title="公告信息" :visible.sync="dialogFormVisible">
      <el-form
        :model="curNotice"
        v-loading="loading"
        element-loading-text="图片跟新中"
        element-loading-spinner="el-icon-loading"
        element-loading-background="rgba(255, 255, 255, 0.2)"
      >
        <el-form-item label="公告id" :label-width="formLabelWidth" v-show="flag===0">
          <el-input v-model="curNotice.id" disabled autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="公告名称" :label-width="formLabelWidth">
          <el-input v-model="curNotice.name"  autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="公告图片" :label-width="formLabelWidth">
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
        <el-form-item label="公告描述" :label-width="formLabelWidth">
          <el-input
            v-model="curNotice.description"
            autocomplete="off"
            type="textarea"
            :rows="4"
            placeholder="请输入内容"></el-input>
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
import notice from "@/api/notice";

export default {
  name: "Delicacy",
  data () {
    return {
      noticeList: [],
      dialogFormVisible: false,
      flag: null,
      curNotice: {},
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
    this.getPageNotice()
  },

  methods: {
    // 调用接口获取所有公告信息
    async getPageNotice() {
      let res = await notice.getPageNotice(this.current, this.limit)
      this.noticeList = res.data.rows
      this.total = res.data.total
    },

    // 调用接口添加公告信息
    async addNotice(data) {
      let res = await notice.addNotice(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("添加成功")
        this.getPageNotice()
      } else {
        this.$message.error("添加失败")
      }
    },

    // 调用接口修改公告信息
    async updateNotice(data) {
      let res = await notice.updateNotice(data)
      if (res.code == 20000) {
        this.dialogFormVisible = false
        this.$message.success("修改成功")
        this.getPageNotice()
      } else {
        this.$message.error("修改失败")
      }
    },

    // 调用接口根据id删除公告
    removeNotice(data) {
      this.$confirm(`此操作将永久删除${data.name}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await notice.removeNotice(data.id)
        if (res.code == 20000) {
          this.getPageNotice()
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
      this.curNotice = Object.assign({}, row)
      this.flag = 0
      this.dialogFormVisible = true
    },

    // 删除按钮
    handleDelete(index, row) {
      this.removeNotice(row)
    },


    // 添加按钮
    handleAdd() {
      this.flag = 1
      this.dialogFormVisible = true
    },

    // 确定按钮, flag为1就添加公告，为0就修改公告
    handleModify() {
      if (this.flag === 1) {
        this.addNotice(this.curNotice)
      } else {
        this.updateNotice(this.curNotice)
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
      this.curNotice.picture = res.data.url
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
      this.getPageNotice()
    },

    calcIndex(index) {
      return (this.current -1) * this.limit + index + 1
    }
  }
}
</script>

<style scoped>

</style>
