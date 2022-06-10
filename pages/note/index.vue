<template>
  <div class="relative note-container w-screen h-auto">

    <el-button @click="dialog = true" class="absolute top-32 right-4 w-16 h-16" type="primary" icon="el-icon-edit" circle></el-button>

    <section class="w-4/5 h-auto mx-auto pt-32">
      <noteFeedback/>
      <noteFeedback/>
      <noteFeedback/>
      <noteFeedback/>
      <noteFeedback/>
    </section>

    <section class="w-screen h-auto">
      <pagination :cur="cur" :limit="limit" :total="total" :continueNum="continueNum" @changePage="changePage" class="w-1/4 mx-auto"/>
    </section>

<!--    上传部分-->
    <el-drawer
      title="游记上传"
      :visible.sync="dialog"
      direction="ltr"
      custom-class="demo-drawer"
      ref="drawer"
      :before-close="handleClose"
      style="width: 2500px"
    >
      <!--  上传图片  -->
      <div class="pl-28 pb-16">
        <span>上传照片</span>
        <el-upload
          action="http://localhost:8091/travel_system/front/upload/picture"
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
      </div>

      <div class="demo-drawer__content">
        <el-form :model="note">
          <el-form-item label="游记内容:" :label-width="formLabelWidth">
            <el-input v-model="note.content" autocomplete="off" type="textarea" :rows="12" placehoder="请填写游玩感受"></el-input>
          </el-form-item>
        </el-form>
        <div class="demo-drawer__footer">
          <el-button @click="cancelForm" class="ml-36">取 消</el-button>
          <el-button type="primary" @click="$refs.drawer.closeDrawer()" :loading="loading">{{ loading ? '提交中 ...' : '确 定' }}</el-button>
        </div>
      </div>
    </el-drawer>
  </div>
</template>

<script>
import noteFeedback from "~/components/noteFeedback";
import pagination from "~/components/pagination";
import {mapState} from 'vuex'

export default {
  name: "note",
  components: {
    noteFeedback,
    pagination
  },
  data() {
    return {
      cur: null,
      limit: 5,
      continueNum: 3,
      total: null,
      formLabelWidth: '80px',
      loading: false,
      dialog: false,
      timer: null,
      note: {
        touristId: null,
        content: null,
        photoUrlList: []
      },
      dialogImageUrl: '',
      dialogVisible: false,
    }
  },
  computed: {
    ...mapState({
      userInfo: state => state.userInfo
    })
  },
  methods: {
    changePage(page) {
      this.cur = page
      this.getPageData()
    },

    cancelForm() {
      this.loading = false;
      this.dialog = false;
      clearTimeout(this.timer);
    },

    handleClose(done) {
      if (this.loading) {
        return;
      }
      this.$confirm('确定要提交表单吗？')
        .then(_ => {
          this.loading = true;
          this.timer = setTimeout(() => {
            this.uploadTravelNote()
            done();
            // 动画关闭需要一定的时间
            setTimeout(() => {
              this.loading = false;
            }, 400);
          }, 2000);
        })
        .catch(_ => {});
    },

    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },

    handleRemove(file, fileList) {
      console.log(file, fileList);
    },

    handleUploadSuccess (res, file, fileList) {
      if (res.code == 20000) {
        this.$message.success("上传图片成功")
        this.note.photoUrlList = fileList.map(file => {
          return file.response.data.url
        })
      } else {
        this.$message.error("上传图片失败")
      }
    },

    async uploadTravelNote() {
      this.note.touristId = this.userInfo.id
      let res = await this.$axios.post('/addNote', this.note)
      if (res.code === 20000) {
        this.$message.success('上传游记成功')
        this.note = {}
      } else {
        this.$message.error('上传游记失败')
      }
    }
  }
}
</script>

<style scoped>
.note-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
