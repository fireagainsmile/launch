# lambdacli tx market create-machine

## Introduction

Send transaction to create a machine

## Usage

``
lambdacli tx market create-machine [flags]
```

Print help messages:
```
lambdacli tx market create-machine --help
```

## Unique Flags

| Name, shorthand               | type   | Required| Default  | Description                                                         |
| ----------------------------  | -----  | --------| -------- | ------------------------------------------------------------------- |
| --name                        | string | true    | ""       | machine name | 
| --dht-id                      | string | true    | ""       | machine dht id |
| --pub-key                     | string | true    | ""       | machine pub key | 
| --from                        | string | true    | ""       | Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market create-machine --dht-id FqtQvNFpxtmUgZvGHMgUrNE5xXobEDvXBHC5Ko8cf1E7 \
 --name SLL04 --pub-key 1624de642023c3fa106d3a76ebbf7cfd0c97bb6d9923f733ff97e7707be95d1371b84cc184\
  --from miner

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"2","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateMachine","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","name":"SLL04","peerId":"abcdefghijklmnopqrst","dhtId":"FqtQvNFpxtmUgZvGHMgUrNE5xXobEDvXBHC5Ko8cf1E7","pubKey":{"type":"tendermint/PubKeyEd25519","value":"I8P6EG06duu/fP0Ml7ttmSP3M/+X53B76V0TcbhMwYQ="}}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 384
  TxHash: EC46B2280CB7A9F609774E8372399C7B234D30AE3AB41584BA83A48082DCA6C5
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 18064
  Tags: 
    - action = createMachine
    - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
    
  "timestamp": "2019-10-29T03:45:49Z"
```

```json
 {
 	"height": "384",
 	"txhash": "EC46B2280CB7A9F609774E8372399C7B234D30AE3AB41584BA83A48082DCA6C5",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "18064",
 	"tags": [{
 		"key": "action",
 		"value": "createMachine"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgCreateMachine",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
 					"name": "SLL04",
 					"peerId": "abcdefghijklmnopqrst",
 					"dhtId": "FqtQvNFpxtmUgZvGHMgUrNE5xXobEDvXBHC5Ko8cf1E7",
 					"pubKey": {
 						"type": "tendermint/PubKeyEd25519",
 						"value": "I8P6EG06duu/fP0Ml7ttmSP3M/+X53B76V0TcbhMwYQ="
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
 					"value": "A10Y+N2g+ZxgJ0y+v1lqPoUJH3xvUc06Id0Jfxfa38rM"
 				},
 				"signature": "L9Vu2D7HHjsbpLHhGnGa5LyxXF811vgIOGOIwcBljwYwnJWYWM1y6k2y+rCOmKBGxnY4igCdBQr2Fle82anOrQ=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T03:45:49Z"
 }
```
