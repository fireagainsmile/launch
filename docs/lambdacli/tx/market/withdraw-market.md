# lambdacli tx market withdraw-market

## Introduction

Send transaction to withdraw a market income

## Usage

```
lambdacli tx market withdraw-market [marketName] [flags]
```

Print help messages:
```
lambdacli tx market withdraw-market --help
```

## Unique Flags

| Name, shorthand    | type   | Required | Default  | Description                                                         |
| ------------------ | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from             | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market withdraw-market market1 --from master
```

Sample Output:
```txt
$ ./lambdacli tx market withdraw-market market1 --from zcTest --broadcast-mode block
{"chain_id":"songtest","account_number":"4","sequence":"1","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgWithDrawMarket","value":{"address":"lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7","marketName":"market1"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'zcTest':
Response:
  Height: 66
  TxHash: B2D5A1B119E463F521E533C9CC5E76B6655C88CCC121B60E5D374A353678873F
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 31286
  Tags: 
    - action = withdrawMarket
    - address = lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7
    - inCome = 6333333ulamb 
```

```json
 {
 	"height": "66",
 	"txhash": "B2D5A1B119E463F521E533C9CC5E76B6655C88CCC121B60E5D374A353678873F",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "31286",
 	"tags": [{
 		"key": "action",
 		"value": "withdrawMarket"
 	}, {
 		"key": "address",
 		"value": "lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7"
 	}, {
 		"key": "inCome",
 		"value": "6333333ulamb"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgWithDrawMarket",
 				"value": {
 					"address": "lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7",
 					"marketName": "taobao"
 				}
 			}],
 			"fee": {
 				"amount": null,
 				"gas": "200000"
 			},
 			"signatures": [{
 				"pub_key": {
 					"type": "tendermint/PubKeySecp256k1",
 					"value": "AuIkUOBCfH//rPNoT+pDZ5YtULrKwX2a0P39GDEqJzkC"
 				},
 				"signature": "ovbLmpngEy6MncOkBrvVPzpxI6kglFF5aw8H+AOgHvpYIW9JCQQMNGS4MZVnwQGbArdG4jYIkekDv4SrTYBvqQ=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2020-05-14T09:52:51Z"
 }
```
