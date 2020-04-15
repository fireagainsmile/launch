# lambdacli tx market cancel-order

## Introduction

Send transaction to cancel a sell order

## Usage

```
lambdacli tx market cancel-order [order-id] [flags]
```

Print help messages:
```
lambdacli tx market cancel-order --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 $ ./lambdacli tx market cancel-order 032105F059A62D2E3AD77BE042A1FACADD5EBEF9 --from miner  

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"6","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCancelSellOrder","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","orderId":"032105F059A62D2E3AD77BE042A1FACADD5EBEF9"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
   Height: 1765
    TxHash: 244D10AF9FA56C557EDB101D1938605C895E8505FBAD8FD36B4B1DDAD23E09B2
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 63943
    Tags: 
      - action = cancelOrder
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
      - orderId = 032105F059A62D2E3AD77BE042A1FACADD5EBEF9
      - amount = 1000000000ulamb
    "timestamp": "2019-10-29T06:29:53Z"
```

```json
 {
 	"height": "1765",
 	"txhash": "244D10AF9FA56C557EDB101D1938605C895E8505FBAD8FD36B4B1DDAD23E09B2",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "63943",
 	"tags": [{
 		"key": "action",
 		"value": "cancelOrder"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}, {
 		"key": "orderId",
 		"value": "032105F059A62D2E3AD77BE042A1FACADD5EBEF9"
 	}, {
 		"key": "amount",
 		"value": "1000000000ulamb"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgCancelSellOrder",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
 					"orderId": "032105F059A62D2E3AD77BE042A1FACADD5EBEF9"
 				}
 			}],
 			"fee": {
 				"amount": null,
 				"gas": "200000"
 			},
 			"signatures": [{
 				"pub_key": {
 					"type": "tendermint/PubKeySecp256k1",
 					"value": "A10Y+N2g+ZxgJ0y+v1lqPoUJH3xvUc06Id0Jfxfa38rM"
 				},
 				"signature": "OWBi0GB/Oc2P+wXx/vYgjkUNZaVFcYidy03LYOX4agAh/BfPnOmJHcaeHB6dKOFd7K+wG4KHmG58/8SQWR2PbA=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T06:29:53Z"
 }
```
