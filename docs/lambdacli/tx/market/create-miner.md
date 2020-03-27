# lambdacli tx market create-miner

## Introduction

Send transaction to create a miner

## Usage

```
lambdacli tx market create-miner [flags]
```

Print help messages:
```
lambdacli tx market create-miner --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --dht-id                     | string | true     | ""       |  miner service Identity in DHT NetWork |
| --mining-address             | string | true     | ""       |  miner sub-account for Mining |  
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 ./lambdacli tx market create-miner --dht-id 8Et9kcTMpixkfggqPqWcd4XaYWgQNwF7WCNdbPF18YFZ  --mining-address lambda1urudd7phn2chstjz9sm6hk2q9hq6c2e4zguwju --from master
```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"1","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateMiner","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 186
  TxHash: B766530772095760BFDCFB6164E01633D7271844798A6F585EE1826F0197A707
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 17918
  Tags: 
    - action = createMiner
    - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
    - size = 1000.000000000000000000
    
  "timestamp": "2019-10-29T03:29:03Z"
```

```json
 {
 	"height": "186",
 	"txhash": "B766530772095760BFDCFB6164E01633D7271844798A6F585EE1826F0197A707",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "17918",
 	"tags": [{
 		"key": "action",
 		"value": "createMiner"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}, {
 		"key": "size",
 		"value": "1000.000000000000000000"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgCreateMiner",
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
 				"signature": "mOc0aCyAq/ygrDdjFM77F9MpfpdWZneZ5cW5GFR/7Nxv3ihzaVa5isoYoYDzY3mL4AKRSVlfEqrRs3q98PtP0A=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T03:29:03Z"
 }
```
