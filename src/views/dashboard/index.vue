<template>
  <div class="dashboard-container">
    <panel-group></panel-group>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import panelGroup from './panelGroup'

export default {
  name: 'Dashboard',
  components: {
    panelGroup
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  }
}
</script>

<style lang="scss" scoped>
.dashboard-container{
  width: 100%;
  min-height: 100vh;
  background-color: #f0f2f5;
  padding: 0 20px 0 20px;
}

</style>
