# lambdacli tx market create-buyorderorder

## Introduction

Send transaction to create a buy order

## Usage

``
lambdacli tx market create-buyorder [flags]
```

Print help messages:
```
lambdacli tx market create-buyorder --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default                      | Description                                                         |
| ---------------------------- | -----  | -------- | ---------------------------- | ------------------------------------------------------------------- |
| --market-name                | string | true     | ""                           | order below which market | 
| --size                       | string | true     | ""                           |  buy size(GB)  |
| --duration                   | string | true     | ""                           | buy duration(month)  |
| --sellorder-id               | string | false    | "[do-not-input-value]"       | Designated purchase sell order id   |
| --from                       | string | true     | ""                           |  Name or address of private key with which to sign |

## Examples

```
$ lambdacli tx market create-buyorder --duration 2month --market-name xxx-market --size 100GB --from user --broadcast-mode block

```

Sample Output:
```txt
{"chain_id":"lambdatest","account_number":"3","sequence":"0","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateBuyOrder","value":{"address":"lambda1urudd7phn2chstjz9sm6hk2q9hq6c2e4zguwju","duration":"5184000000000000","size":"100","sellOrderId":"[do-not-input-value]","marketName":"xxx-market"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'user':
Response:
  Height: 1858
    TxHash: 79D18012E735F97B79ACD80120A5442F1C70B9D00E5FAFB79A17D647869AA542
    Raw Log: [{"msg_index":"0","success":true,"log":""}]
    Logs: [{"msg_index":0,"success":true,"log":""}]
    GasWanted: 200000
    GasUsed: 103765
    Tags: 
      - action = createBuyOrder
      - address = lambda1urudd7phn2chstjz9sm6hk2q9hq6c2e4zguwju
      - orderId = 82912541E287BF70EF0098D51C21E7D6A83D55B5
      - buyOrder = 0a28383239313235343145323837424637304546303039384435314332314537443641383344353542351214e0f8d6f8379ab1782e422c37abd9402dc1ac2b351a033130302080e0ba84bf032a130a05756c616d62120a313030303030303030303228334132423339364345353041443236363034413532354145334636314636373134453637463539343a2844323741423330373543423342394130443944333744323037453842353132374230363546393733421467860af5214d7ce482a026c9de976c6301a2a7c94a0c08babcdfed0510e8ed97e402
      - matchOrder = 0a28443237414233303735434233423941304439443337443230374538423531323742303635463937331214ba8bb9e37fc8b8a9407023208f336d288079afd41a14e0f8d6f8379ab1782e422c37abd9402dc1ac2b352228334132423339364345353041443236363034413532354145334636314636373134453637463539342a28383239313235343145323837424637304546303039384435314332314537443641383344353542353207353030303030303a03313030420c08babcdfed0510e8ed97e4024a0c08b2bddfed0510e8ed97e4025080c0e285e3685a0c08babcdfed0510e8ed97e4026a1467860af5214d7ce482a026c9de976c6301a2a7c97205534c4c30347a130a05756c616d62120a313030303030303030308201120a05756c616d621209353030303030303030
      
   "timestamp": "2019-10-29T06:37:46Z"
```

```json
 {
 	"height": "1858",
 	"txhash": "79D18012E735F97B79ACD80120A5442F1C70B9D00E5FAFB79A17D647869AA542",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "103765",
 	"tags": [{
 		"key": "action",
 		"value": "createBuyOrder"
 	}, {
 		"key": "address",
 		"value": "lambda1urudd7phn2chstjz9sm6hk2q9hq6c2e4zguwju"
 	}, {
 		"key": "orderId",
 		"value": "82912541E287BF70EF0098D51C21E7D6A83D55B5"
 	}, {
 		"key": "buyOrder",
 		"value": "0a28383239313235343145323837424637304546303039384435314332314537443641383344353542351214e0f8d6f8379ab1782e422c37abd9402dc1ac2b351a033130302080e0ba84bf032a130a05756c616d62120a313030303030303030303228334132423339364345353041443236363034413532354145334636314636373134453637463539343a2844323741423330373543423342394130443944333744323037453842353132374230363546393733421467860af5214d7ce482a026c9de976c6301a2a7c94a0c08babcdfed0510e8ed97e402"
 	}, {
 		"key": "matchOrder",
 		"value": "0a28443237414233303735434233423941304439443337443230374538423531323742303635463937331214ba8bb9e37fc8b8a9407023208f336d288079afd41a14e0f8d6f8379ab1782e422c37abd9402dc1ac2b352228334132423339364345353041443236363034413532354145334636314636373134453637463539342a28383239313235343145323837424637304546303039384435314332314537443641383344353542353207353030303030303a03313030420c08babcdfed0510e8ed97e4024a0c08b2bddfed0510e8ed97e4025080c0e285e3685a0c08babcdfed0510e8ed97e4026a1467860af5214d7ce482a026c9de976c6301a2a7c97205534c4c30347a130a05756c616d62120a313030303030303030308201120a05756c616d621209353030303030303030"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgCreateBuyOrder",
 				"value": {
 					"address": "lambda1urudd7phn2chstjz9sm6hk2q9hq6c2e4zguwju",
 					"duration": "5184000000000000",
 					"size": "100",
 					"sellOrderId": "[do-not-input-value]",
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
 					"value": "AlOtKapJpODOdA+xvQcA+cXZ5H/8M0A+u5t+wfYvVKe5"
 				},
 				"signature": "ec47ejMlj1k8TEVkfaRYYJJF5seJQZRmFe7b8F2wssNgQeH9cW/bbFHexBt8a+Lt/Uqfyq57zj7kp24Labvokg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-10-29T06:37:46Z"
 }
```
