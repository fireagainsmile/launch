# lambdacli tx market create-sellorder

## Introduction

Send transaction to create a sell order

## Usage

``
lambdacli tx market create-sellorder [flags]
```

Print help messages:
```
lambdacli tx market create-sellorder --help
```

## Unique Flags

| Name, shorthand    | type   | Required | Default  | Description                                                         |
| ------------------ | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --market-name      | string | true     | ""           | order below which market | 
| --machine-name     | string | true     | ""           | use which machine for sell order |
| --price            | string | false    | 5000000ulamb | sell order price|
| --rate             | string | false    | 3            | sell order rate  |
| --min-size         | string | false    | 1GB          | sell order min buy size  |
| --min-buy-duration | string | false    | 1month       |  sell order min buy duration  |
| --max-buy-duration | string | false    | 60month      | sell order max buy duration  | 
| --from             | string | true     | ""           |  Name or address of private key with which to sign |

## Examples

```
$ lambdacli tx market create-sellorder --price 5000000ulamb \
--rate 1 --size 200GB \
--market-name xxx-market \
--machine-name Machine01 \
--min-size 10GB \
 --from miner

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"2","sequence":"5","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateSellOrder","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","marketName":"xxx-market","price":"5000000","rate":"1.000000000000000000","sellSize":"200","machineName":"SLL04","cancelTimeDuration":"0","minBuySize":"10","minBuyDuration":"2592000000000000","maxBuyDuration":"1555200000000000000"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'miner':
Response:
  Height: 628
    TxHash: 5E0A872A302A54090915A40309C2752E87D6D7AA0224AEBB857ED8630491FD60
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 87049
    Tags: 
      - action = createSellOrder
      - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
      - orderId = 032105F059A62D2E3AD77BE042A1FACADD5EBEF9
      - sellOrder = 0a28303332313035463035394136324432453341443737424530343241314641434144443545424546391214ba8bb9e37fc8b8a9407023208f336d288079afd41a07353030303030302213313030303030303030303030303030303030302a130a05756c616d62120a3130303030303030303032033230303a033230304a0c08c4f5deed0510b0bc8a87035080c0e285e3685a1467860af5214d7ce482a026c9de976c6301a2a7c96205534c4c30346a0231307080b09dc2df017880e0a596bb11
      
    "timestamp": "2019-10-29T04:06:28Z"
```

```json
 {
 	"height": "628",
 	"txhash": "5E0A872A302A54090915A40309C2752E87D6D7AA0224AEBB857ED8630491FD60",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "87049",
 	"tags": [{
 		"key": "action",
 		"value": "createSellOrder"
 	}, {
 		"key": "address",
 		"value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
 	}, {
 		"key": "orderId",
 		"value": "032105F059A62D2E3AD77BE042A1FACADD5EBEF9"
 	}, {
 		"key": "sellOrder",
 		"value": "0a28303332313035463035394136324432453341443737424530343241314641434144443545424546391214ba8bb9e37fc8b8a9407023208f336d288079afd41a07353030303030302213313030303030303030303030303030303030302a130a05756c616d62120a3130303030303030303032033230303a033230304a0c08c4f5deed0510b0bc8a87035080c0e285e3685a1467860af5214d7ce482a026c9de976c6301a2a7c96205534c4c30346a0231307080b09dc2df017880e0a596bb11"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgCreateSellOrder",
 				"value": {
 					"address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
 					"marketName": "taobao",
 					"price": "5000000",
 					"rate": "1.000000000000000000",
 					"sellSize": "200",
 					"machineName": "SLL04",
 					"cancelTimeDuration": "0",
 					"minBuySize": "10",
 					"minBuyDuration": "60000000000",
 					"maxBuyDuration": "600000000000"
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
 				"signature": "OkVuM3BJ+uiwj+ZiqACYmTdPIiWiBAGQWqWviyMhFQMDFyHOUJf4otiZql0Xvr8tyEoGXEoGf17pR32EXeAE8w=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T04:06:28Z"
 }
```
