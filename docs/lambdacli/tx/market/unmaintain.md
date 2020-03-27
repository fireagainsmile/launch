# lambdacli tx market unmaintain

## Introduction

Send transaction to cancel maintain a miner

## Usage

``
lambdacli tx market unmaintain [flags]
```

Print help messages:
```
lambdacli tx market unmaintain --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from                       | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market unmaintain --from miner

```

Sample Output:
```txt
{"chain_id":"songtest","account_number":"2","sequence":"5","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgUnMaintain","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
    Height: 126
    TxHash: FF59363C139262DE8E4C5F2E61713E435AE424B7B820075DAE4C2BC66A6745BD
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 10068
    Tags: 
      - action = unMaintain
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
  
    Timestamp: 2020-03-18T13:52:08Z

```

```json
 {
 	"height": "126",
 	"txhash": "FF59363C139262DE8E4C5F2E61713E435AE424B7B820075DAE4C2BC66A6745BD",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "10068",
 	"tags": [{
 		"key": "action",
 		"value": "unMaintain"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgUnMaintain",
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
 				"signature": "fQhEsFwzl0o1zUwLWzFjIKbRQCtaZwrbIJEZ03fq1B4KpV6J1N3lGc4BqUW20h28VfSflGscpuqu9u4/tEjvLA=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2020-03-18T13:52:08Z"
 }
```
