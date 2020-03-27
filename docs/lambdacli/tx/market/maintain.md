# lambdacli tx market maintain

## Introduction

Send transaction to maintain a miner

## Usage

``
lambdacli tx market maintain [flags]
```

Print help messages:
```
lambdacli tx market maintain --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market maintain --from miner

```

Sample Output:
```txt
{"chain_id":"songtest","account_number":"2","sequence":"4","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgMaintain","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 107
    TxHash: 2ABAAABF7B6668EB7BDE2F7A54C4181B0A1230BBA9B0F27E86B4E2513DF99B96
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 12131
    Tags: 
      - action = maintain
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
  
    Timestamp: 2020-03-18T11:26:47Z
```

```json
 {
 	"height": "107",
 	"txhash": "2ABAAABF7B6668EB7BDE2F7A54C4181B0A1230BBA9B0F27E86B4E2513DF99B96",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "12131",
 	"tags": [{
 		"key": "action",
 		"value": "maintain"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgMaintain",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
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
 				"signature": "f76+3IG1/OzP2wZU2gpsjkhTd1OZGhZ0jbXNpdoryC0ahZb9oOns8xxh+3vKJhq7X1qJXkyhJPmQZcIoYjydyg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2020-03-18T11:26:47Z"
 }
```
