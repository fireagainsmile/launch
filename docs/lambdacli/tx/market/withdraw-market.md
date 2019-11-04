# lambdacli tx market withdraw-market

## Introduction

Send transaction to withdraw a market income

## Usage

``
lambdacli tx market withdraw-market [flags]
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
 lambdacli tx market withdraw-market --from master

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"0","sequence":"7","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgWithDrawMarket","value":{"address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  Height: 1987
    TxHash: DEB6272BBB7378999051ADA0F74835C6D3D3855EECEDCAB8F8B1FF35F2CDE917
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 24993
    Tags: 
      - action = withdrawMarket
      - address = lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9
      - inCome = 50000000ulamb
  
    Timestamp: 2019-10-29T06:48:41Z
    
```

```json
 {
 	"height": "1987",
 	"txhash": "DEB6272BBB7378999051ADA0F74835C6D3D3855EECEDCAB8F8B1FF35F2CDE917",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "24993",
 	"tags": [{
 		"key": "action",
 		"value": "withdrawMarket"
 	}, {
 		"key": "address",
 		"value": "lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9"
 	}, {
 		"key": "inCome",
 		"value": "50000000ulamb"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgWithDrawMarket",
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
 				"signature": "4wOufWgJf9DrpYmMUZEIiM+al/00KepxQXqBJue53IEGVnaFQvFud51UfVB6h4fhwurJP2c4pwj1PxT88I60yA=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T06:48:41Z"
 }
```
