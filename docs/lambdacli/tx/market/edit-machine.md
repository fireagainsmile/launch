# lambdacli tx market edit-machine

## Introduction

Send transaction to edit a machine

## Usage

``
lambdacli tx market edit-machine [flags]
```

Print help messages:
```
lambdacli tx market edit-machine --help
```

## Unique Flags

| Name, shorthand   | type   | Required | Default  | Description                                                         |
| ----------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --name            | string | true     | ""       | machine name  | 
| --dht-id          | string | false    | ""       | modify dht id value |
| --peer-id         | string | false    | ""       | modify peer id value |
| --from            | string | true     | ""       | Name or address of private key with which to sign |

## Examples

```
lambdacli tx market edit-machine --name SLL04 --peer-id lambdakjinah1nczjeka --from miner

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"4","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgEditMachine","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","name":"SLL04","peerId":"lambdakjinah1nczjeka","dhtId":"[do-not-modify]"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 499
    TxHash: 7D28994CC67F88CB944BAB855AC4920743B366AFA0B3054787A8635887FCD77A
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 16563
    Tags: 
      - action = editMachine
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
      - peerId = lambdakjinah1nczjeka
      
    "timestamp": "2019-10-29T03:55:33Z"
```

```json
 {
 	"height": "499",
 	"txhash": "7D28994CC67F88CB944BAB855AC4920743B366AFA0B3054787A8635887FCD77A",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "16563",
 	"tags": [{
 		"key": "action",
 		"value": "editMachine"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}, {
 		"key": "peerId",
 		"value": "lambdakjinah1nczjeka"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgEditMachine",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
 					"name": "SLL04",
 					"peerId": "lambdakjinah1nczjeka",
 					"dhtId": "[do-not-modify]"
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
 				"signature": "RV3ekIeDpPBSZ0DS1VZiQ8ZXTr4Uyr7x8nWGzMP0YyI1RNOkMal+1K3JyXYQoXIt3mcBD5UN3mmqVOV2vkr8rg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T03:55:33Z"
 }
```
