<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'ZhiJianDoc',
  data() {
    return {
      url: 'http://doc.zhijian.vip'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
