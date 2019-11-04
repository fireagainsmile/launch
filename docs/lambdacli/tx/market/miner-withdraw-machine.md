# lambdacli tx market miner-withdraw-machine

## Introduction

Send transaction to withdraw a machine reward by miner

## Usage

``
lambdacli tx market miner-withdraw-machine [machine-name] [flags]

```

Print help messages:
```
lambdacli tx market miner-withdraw-machine --help
```

## Unique Flags

| Name, shorthand   | type   | Required | Default  | Description                                                         |
| ----------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from            | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 lambdacli tx market miner-withdraw-machine machineOne --from miner

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"9","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgMinerWithDrawMachine","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","machineName":"machineOne"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 2127
    TxHash: 1486ABC1C7DF60CCAAFD6709F7C89728EAA965A188E02CE1C26D6096F645045C
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 64582
    Tags: 
      - action = minerWithdrawMachine
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
      - withdrawMiner = 750000000ulamb
      - withDrawDetail = 5b7b226f726465724964223a2236313730453135454531373830334441353646434646303132353836444330314335463134433731222c226d696e6572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a22323530303030303030227d2c2275736572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a22353030303030303030227d7d5d
      - withdrawTime = 2019-10-29 07:00:32.62739 +0000 UTC
  
    Timestamp: 2019-10-29T07:00:32Z
    
```

```json
 {
 	"height": "2127",
 	"txhash": "1486ABC1C7DF60CCAAFD6709F7C89728EAA965A188E02CE1C26D6096F645045C",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "64582",
 	"tags": [{
 		"key": "action",
 		"value": "minerWithdrawMachine"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}, {
 		"key": "withdrawMiner",
 		"value": "750000000ulamb"
 	}, {
 		"key": "withDrawDetail",
 		"value": "5b7b226f726465724964223a2236313730453135454531373830334441353646434646303132353836444330314335463134433731222c226d696e6572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a22323530303030303030227d2c2275736572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a22353030303030303030227d7d5d"
 	}, {
 		"key": "withdrawTime",
 		"value": "2019-10-29 07:00:32.62739 +0000 UTC"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgMinerWithDrawMachine",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
 					"machineName": "machineOne"
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
 				"signature": "5143UAhENTz9rmWWYJWrOslqABx7kkDuG87XV3SUPx0VTpH+dtghXu+FVLTGPN1/lUddwhTzOv8ogNDbSp1B6Q=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T07:00:32Z"
 }
```
