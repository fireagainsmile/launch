# lambdacli tx staking delegate

## Introduction

Delegate tokens to a validator

## Usage

```
lambdacli tx staking delegate <validator-address> 1000000utbb --from peter
lambdacli tx staking delegate <validator-address> 1000000utbb --from peter [flags]
```

Print help messages:
```
lambdacli tx staking delegate --help
```

## Unique Flags

| Name, shorthand     | type   | Required | Default  | Description                                                         |
| --------------------| -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
lambdacli tx staking delegate lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3 1000000utbb --from peter
```

Output:
```txt
{"chain_id":"lambda-test","account_number":"2","sequence":"6","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgDelegate","value":{"delegator_address":"lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7","validator_address":"lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3","amount":{"denom":"utbb","amount":"1000000"},"validator_type":1}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'peter':
Response:
  TxHash: 34101A05B91113C3FFA76B80E88E4C960D77E91B63EB2D3A80637579A017841E

```

```$xslt
lambdacli query tx 34101A05B91113C3FFA76B80E88E4C960D77E91B63EB2D3A80637579A017841E --output=json
```

```json
{
	"height": "9852",
	"txhash": "34101A05B91113C3FFA76B80E88E4C960D77E91B63EB2D3A80637579A017841E",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "81876",
	"tags": [{
		"key": "action",
		"value": "delegate"
	}, {
		"key": "delegator",
		"value": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7"
	}, {
		"key": "destination-validator",
		"value": "lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3"
	}],
	"tx": {
		"type": "auth/StdTx",
		"value": {
			"msg": [{
				"type": "lambda/MsgDelegate",
				"value": {
					"delegator_address": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7",
					"validator_address": "lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3",
					"amount": {
						"denom": "utbb",
						"amount": "1000000"
					},
					"validator_type": 1
				}
			}],
			"fee": {
				"amount": null,
				"gas": "200000"
			},
			"signatures": [{
				"pub_key": {
					"type": "tendermint/PubKeySecp256k1",
					"value": "AnbvyvfgTApmPkk4WlKnod6g4T4/Kq7z0xt2Pk7ae6cA"
				},
				"signature": "MqyRXSMbkzG/PkO1ULcXXITvtiWufbRueV+Z99DuTjtzlvdQbc/Fa09XuPwCc6BJO3V0QudlrxKozMOcphfPqw=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-21T10:47:17Z"
}
```