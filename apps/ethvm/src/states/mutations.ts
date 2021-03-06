import { Block, Tx, PendingTx, Uncle } from '@app/models'
import { BlockLayout, StateLayout, TxLayout, PendingTxLayout, UncleLayout } from '@app/models/server'

const NEW_BLOCK = (state: StateLayout, blocks: BlockLayout | BlockLayout[]) => {
  if (!Array.isArray(blocks)) {
    blocks = [blocks]
  }

  blocks.forEach(block => {
    state.blocks.add(new Block(block))
  })
}

const NEW_TX = (state: StateLayout, txs: TxLayout | TxLayout[]) => {
  if (!Array.isArray(txs)) {
    txs = [txs]
  }

  txs.forEach(tx => {
    state.txs.add(new Tx(tx))
  })
}

const NEW_PENDING_TX = (state: StateLayout, pTxs: PendingTxLayout | PendingTxLayout[]) => {
  if (!Array.isArray(pTxs)) {
    pTxs = [pTxs]
  }

  pTxs.forEach(pTx => {
    state.pendingTxs.add(new PendingTx(pTx))
  })
}

const NEW_UNCLE = (state: StateLayout, uncles: UncleLayout | UncleLayout[]) => {
  if (!Array.isArray(uncles)) {
    uncles = [uncles]
  }

  uncles.forEach(uncle => {
    state.uncles.add(new Uncle(uncle))
  })
}

export default {
  NEW_BLOCK,
  NEW_TX,
  NEW_UNCLE,
  NEW_PENDING_TX
}
