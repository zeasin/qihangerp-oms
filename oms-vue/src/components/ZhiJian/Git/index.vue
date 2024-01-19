<template>
  <div>
    <svg-icon icon-class="github" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'ZhiJianGit',
  data() {
    return {
      url: 'https://gitee.com/qiliping/zhijian.git'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
