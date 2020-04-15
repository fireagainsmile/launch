# lambdacli tx market unjail

## Introduction

Send transaction to free a miner

## Usage

```
lambdacli tx market unjail [flags]
```

Print help messages:
```
lambdacli tx market unjail --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market unjail --from miner

```

Sample Output:
```txt
{"chain_id":"lambda-chain-test","account_number":"2","sequence":"5","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgUnjailMiner","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 87
    TxHash: 120DFF5A7F281239AB00C5DFFED96B7984D8C8117C346C3A3111877B1DD6BF55
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 28249
    Tags: 
      - action = unjail
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
  
    Timestamp: 2020-03-18T13:48:50Z
```

```json
 {
 	"height": "87",
 	"txhash": "120DFF5A7F281239AB00C5DFFED96B7984D8C8117C346C3A3111877B1DD6BF55",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "28249",
 	"tags": [{
 		"key": "action",
 		"value": "unjail"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgUnjailMiner",
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
 				"signature": "rP5PuFLVm6hx5bZjVpO1IJqOqcNM3hIr2us6pIQVMLV2WC0hR1CCkQOiWod53k+gaWCHkIHVzI3JM2aYU4fbKg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2020-03-18T13:48:50Z"
 }
```
