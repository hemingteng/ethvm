<template>
  <block-component  :title="blockTitle" :colorType="type" :value="difficulty" :backType="background" :metrics="th">
  </block-component>
</template>

<script lang="ts">
import sEvents from '@app/configs/socketEvents.json'
import bn from 'bignumber.js'
import Vue from 'vue'

const getTHs = (_num: string): number => {
  return new bn(_num)
    .div('1e12')
    .round(2)
    .toNumber()
}

export default Vue.extend({
  name: 'ShortDataLastBlock',
  data() {
    return {
      blockTitle: this.$i18n.t('smlBlock.diff'),
      background: 'difficulty',
      type: 'error white--text',
      difficulty: 0,
      th: 'Th'
    }
  },
  created() {
    if (this.$store.getters.getBlocks.length) {
      this.difficulty = getTHs(this.$store.getters.getBlocks[0].getDifficulty().toNumber()).toString()
    }
    this.$eventHub.$on(sEvents.pastBlocksR, () => {
      this.difficulty = getTHs(this.$store.getters.getBlocks[0].getDifficulty().toNumber())
    })
    this.$eventHub.$on(sEvents.newBlock, _block => {
      this.difficulty = getTHs(_block.getDifficulty().toNumber())
    })
  },
  beforeDestroy() {
    this.$eventHub.$off([sEvents.pastBlocksR, sEvents.newBlock])
  }
})
</script>

<style scoped lang="less">
</style>
