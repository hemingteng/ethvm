import * as utils from 'web3-utils'
import { client, ora } from '../shared'

export async function getBalanceCommand(address: string) {
  ora.start(`Obtaining balance of address: ${address}`)

  const resp = await client.callAsync('eth_getBalance', [address, 'latest'])

  ora.succeed(`Current balance: ${utils.fromWei(resp, 'ether')} ether`)
}
