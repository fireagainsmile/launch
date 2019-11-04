# lambdacli tx market withdraw-miner

## Introduction

Send transaction to withdraw a match order reward by miner

## Usage

``
lambdacli tx market withdraw-miner [matchOrder-id] [flags]
```

Print help messages:
```
lambdacli tx market withdraw-miner --help
```

## Unique Flags

| Name, shorthand    | type   | Required | Default  | Description                                                         |
| ------------------ | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from             | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market withdraw-miner D27AB3075CB3B9A0D9D37D207E8B5127B065F973 --from miner

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"8","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgMinerWithDraw","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","matchOrderId":"D27AB3075CB3B9A0D9D37D207E8B5127B065F973"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 2059
    TxHash: 16DE5D09C40D04AE464E6F338ED7290B90BF1FFE0421F52AEC9B353154772601
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 68546
    Tags: 
      - action = minerWithdraw
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
      - orderId = D27AB3075CB3B9A0D9D37D207E8B5127B065F973
      - withdrawMiner = 1500000000ulamb
      - minerPay = 500000000ulamb
      - userPay = 1000000000ulamb
      - withdrawTime = 2019-10-29 06:54:47.177972 +0000 UTC
  
    Timestamp: 2019-10-29T06:54:47Z
    
```

```json
 {
 	"height": "2059",
 	"txhash": "16DE5D09C40D04AE464E6F338ED7290B90BF1FFE0421F52AEC9B353154772601",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "68546",
 	"tags": [{
 		"key": "action",
 		"value": "minerWithdraw"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}, {
 		"key": "orderId",
 		"value": "D27AB3075CB3B9A0D9D37D207E8B5127B065F973"
 	}, {
 		"key": "withdrawMiner",
 		"value": "1500000000ulamb"
 	}, {
 		"key": "minerPay",
 		"value": "500000000ulamb"
 	}, {
 		"key": "userPay",
 		"value": "1000000000ulamb"
 	}, {
 		"key": "withdrawTime",
 		"value": "2019-10-29 06:54:47.177972 +0000 UTC"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgMinerWithDraw",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
 					"matchOrderId": "D27AB3075CB3B9A0D9D37D207E8B5127B065F973"
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
 				"signature": "vpguZPcndjyMcGWkX0Y1deyLWejmaW3S+wzJZHQrlhF31aqaalf2rRklnRjo8SAsHptegxFxFuQhap1ufe52qg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T06:54:47Z"
 }
```
