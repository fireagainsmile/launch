# lambdacli tx staking delegate-partner

## Introduction

Delegate tokens to a partner-validator

## Usage

```
lambdacli tx staking delegate <partner-validator-address> 1000000utbb --from peter [flags]
```

Print help messages:
```
lambdacli tx staking delegate-partner --help
```

## Unique Flags

| Name, shorthand     | type   | Required | Default  | Description                                                         |
| --------------------| -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
lambdacli tx staking delegate-partner lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy 100000utbb --from peter
```

Output:
```txt
{"chain_id":"lambda-test","account_number":"2","sequence":"7","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgDelegate","value":{"delegator_address":"lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7","validator_address":"lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy","amount":{"denom":"utbb","amount":"100000"},"validator_type":0}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'peter':
Response:
  TxHash: 64CF48B59704A5D3C80C2A16BD582FF46990274947F2B7CEF84A467172C78026

```

```$xslt
lambdacli query tx 64CF48B59704A5D3C80C2A16BD582FF46990274947F2B7CEF84A467172C78026 --output=json
```

```json
{
	"height": "11447",
	"txhash": "64CF48B59704A5D3C80C2A16BD582FF46990274947F2B7CEF84A467172C78026",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "83603",
	"tags": [{
		"key": "action",
		"value": "delegate"
	}, {
		"key": "delegator",
		"value": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7"
	}, {
		"key": "destination-validator",
		"value": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy"
	}],
	"tx": {
		"type": "auth/StdTx",
		"value": {
			"msg": [{
				"type": "lambda/MsgDelegate",
				"value": {
					"delegator_address": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7",
					"validator_address": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy",
					"amount": {
						"denom": "utbb",
						"amount": "100000"
					},
					"validator_type": 0
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
				"signature": "Wbr96kNhFWcT0riWTtEGT+veJRs19bd+Q+OksI0tmY9gIwsjOcext+3h5/J4uZ5ZHpDjzLu9bnSrYU03tOTnjA=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-22T02:24:55Z"
}
```