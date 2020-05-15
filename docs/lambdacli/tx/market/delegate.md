# lambdacli tx market delegate

## Introduction

Send transaction to delegate market

## Usage

```
lambdacli tx market delegate [marketName] [amount] [flags]
```

Print help messages:
```
lambdacli tx market delegate --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 $ ./lambdacli tx market delegate lambdamarket 10000000000ulamb --from acc  
```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"4","sequence":"1","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgDelegateMarket","value":{"address":"lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7","marketName":"taobao","amount":{"denom":"ulamb","amount":"5000000000"}}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 12
  TxHash: 844E563856B4A4ED0D9094B5C5A9730D268353655EC29DB43C1D55A683A8E203
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 31082
  Tags: 
    - action = delegateMarket
    - address = lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7
    - amount = 500000000000ulamb
    "timestamp": "2019-10-29T06:29:53Z"
```

```json
 {
 	"height": "12",
 	"txhash": "844E563856B4A4ED0D9094B5C5A9730D268353655EC29DB43C1D55A683A8E203",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "31082",
 	"tags": [{
 		"key": "action",
 		"value": "delegateMarket"
 	}, {
 		"key": "address",
 		"value": "lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7"
 	}, {
 		"key": "amount",
 		"value": "500000000000ulamb"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgDelegateMarket",
 				"value": {
 					"address": "lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7",
 					"marketName": "taobao",
 					"amount": {
 						"denom": "ulamb",
 						"amount": "500000000000"
 					}
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
 				"signature": "WUm8cfCQo5RnJVF+EuQbmoTWl1e9/As2JE0SLq8LCEc90+2qVlZ66y7Kkul3pWggCZLgJhHlAPcyVbRLC0PFiQ=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2020-05-14T09:48:17Z"
 }
```
