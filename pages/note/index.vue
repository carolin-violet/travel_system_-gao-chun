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
      <pagination :cur="cur" :limit="limit" :total="total" :continueNum="continueNum" @changePage="changePage"/>
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
          action=""
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
        content: null,
        pictures: []
      },
      dialogImageUrl: '',
      dialogVisible: false,
    }
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
            done();
            // 动画关闭需要一定的时间
            setTimeout(() => {
              this.loading = false;
            }, 400);
          }, 2000);
        })
        .catch(_ => {});
    },

    handlePictureCardPreview() {

    },

    handleRemove() {

    },

    handleUploadSuccess () {

    },
  }
}
</script>

<style scoped>
.note-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
