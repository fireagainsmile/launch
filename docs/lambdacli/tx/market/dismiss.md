# lambdacli tx market dismiss

## Introduction

Send transaction to dismiss a market

## Usage

```
lambdacli tx market dismiss [flags]
```

Print help messages:
```
lambdacli tx market dismiss --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
$ ./lambdacli tx market dismiss --from acc --broadcast-mode block -y
```

Sample Output:
```txt
$ ./lambdacli tx market dismiss --from master --broadcast-mode block -y
Password to sign with 'master':
Response:
  Height: 1401
  TxHash: 4885AAFC714F02626EBAE7B3096BE55B400C39D86ABF5C55B988DA059C7B9C3A
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 32167
  Tags: 
    - action = dismiss
    - address = lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9
```

```json
 {
 	"height": "1401",
 	"txhash": "4885AAFC714F02626EBAE7B3096BE55B400C39D86ABF5C55B988DA059C7B9C3A",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "32167",
 	"tags": [{
 		"key": "action",
 		"value": "dismiss"
 	}, {
 		"key": "address",
 		"value": "lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgMarketDismiss",
 				"value": {
 					"address": "lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9"
 				}
 			}],
 			"fee": {
 				"amount": null,
 				"gas": "200000"
 			},
 			"signatures": [{
 				"pub_key": {
 					"type": "tendermint/PubKeySecp256k1",
 					"value": "A8wLxTD30uOdHNvAal9ZFdUzhBY5rOjr7LG9r1GkEtzX"
 				},
 				"signature": "mc25999OMbaXeYdH7LseZWa0x/yXj16jRl6A5kZe700pb9u2y4j6e7rj7YYLgaKdvFc3nMVR9+Vgj8xn7Xgrbg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2020-04-20T06:08:19Z"
 }
```
