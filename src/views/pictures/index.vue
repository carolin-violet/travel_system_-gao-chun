<template>
  <div class="app-container">

    <!--  上传图片  -->
    <el-upload
      :action="BASE_API + `/travel_system/oss/picture/addPhoto/${markeId}`"
      list-type="picture-card"
      :on-preview="handlePictureCardPreview"
      :on-remove="handleRemove"
      :on-success="handleUploadSuccess"
    >
      <i class="el-icon-plus"></i>
    </el-upload>
    <el-dialog :visible.sync="dialogVisible">
      <img width="100%" :src="dialogImageUrl" alt="">
    </el-dialog>


    <div class="photo-container">
      <div class="item"  v-for="src in srcList" @click="handleClick(src)">
        <el-image
          :src="src"
          :preview-src-list="srcList"
          lazy="lazy">
          <div slot="placeholder" class="image-slot">
            <img src="/loading.gif" alt="">
          </div>
        </el-image>
      </div>
    </div>


  </div>
</template>

<script>
import photos from "@/api/photos";

export default {
  name: "index",
  data() {
    return {
      markeId: null,
      srcList: [],
      dialogImageUrl: '',
      dialogVisible: false,
      BASE_API: process.env.VUE_APP_BASE_API
    }
  },

  created() {
    this.markeId = this.$route.query.mark_id
    this.findAllPictureByMarkId()
  },

  methods: {
    // 查询当前mark_id对应的所有照片
    async findAllPictureByMarkId() {
      let res = await photos.findAllPictureByMarkId(this.markeId)
      this.srcList = res.data.items
    },

    // 以下为上传图片的方法
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    handleUploadSuccess(res, file, fileList) {
      if (res.code == 20000) {
        this.$message.success("上传成功")
        this.findAllPictureByMarkId()
      } else {
        this.$message.error("上传失败")
      }
    },


    // 通过伪元素冒泡，点击伪类元素触发父元素的方法调用
    handleClick(src) {
      console.log(src)
      this.$confirm(`此操作将永久删除图片${src.split("/").slice(-1)[0]}, 是否继续?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await photos.delPhoto(this.markeId, src)
        if (res.code == 20000) {
          this.$message.success("删除成功")
          this.findAllPictureByMarkId()
        } else {
          this.$message.error("删除失败")
        }
      }).catch(() => {
        this.$message.info("已取消删除")
      });
    }
  }
}
</script>

<style scoped lang="scss">
@import "./iconfont/iconfont.css";

.photo-container{
  margin-top: 50px;
  width: 100%;
  height: 100%;
  column-count: 4;
  column-gap: 20px;
  .item{
    margin-bottom: 10px;
    position: relative;
    .el-image{
      width: 100%;
      height: auto;
      position: relative;
      pointer-events: none;
    }
    &:hover{
      &:after{
        font-family: "iconfont";
        content: "\e67e";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        color: red;
        font-size: 40px;
        cursor: pointer;
        animation: move 100ms;
        pointer-events: all;
      }
      @keyframes move {
        0%{transform: translateY(100%)}
        100%{transform: translateY(0)}
      }
    }
  }
}
</style>
