# lambdacli tx staking create-partner-validator

## Introduction

create a lambda partner validator actor

## Usage

```
lambdacli tx staking create-partner-validator [flags]
```

Print help messages:
```
lambdacli tx staking create-partner-validator --help
```

## Unique Flags

| Name, shorthand              | type   | Required | Default  | Description                                                         |
| ---------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --amount                     | string | true     | ""       | Amount of coins to bond |
| --details                    | string | false    | ""       | Optional details |
| --identity                   | string | false    | ""       | Optional identity signature (ex. UPort or Keybase) |
| --ip                         | string | false    | ""       | Node's public IP. It takes effect only when used in combination with |
| --moniker                    | string | true     | ""       | Validator name |
| --pubkey                     | string | true     | ""       | Go-Amino encoded hex PubKey of the validator. For Ed25519 the go-amino prepend hex is 1624de6220 |
| --website                    | string | false    | ""       | Optional website |

## Examples

```
lambdacli tx staking create-partner-validator \                                    
  --amount 33333333utbb \
  --pubkey lambdavalconspub1zcjduepq8qu9rg2srwxq9ze202pk6u8594e55mz909kuup3czr0mqvlfjjlslea3cn \
  --moniker "partner1" \
  --chain-id lambda-test \
  --from partner1
```

Sample Output:
```txt
{"chain_id":"lambda-test","account_number":"4","sequence":"2","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateValidator","value":{"description":{"moniker":"partner1","identity":"","website":"","details":""},"commission":{"rate":"0.250000000000000000","max_rate":"0.250000000000000000","max_change_rate":"0.010000000000000000"},"min_self_delegation":"33333333","delegator_address":"lambda1h7pnxzejqtzlfcad89hkn0ersjqmfsj89re3ks","validator_address":"lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy","pubkey":"lambdavalconspub1zcjduepq8qu9rg2srwxq9ze202pk6u8594e55mz909kuup3czr0mqvlfjjlslea3cn","value":{"denom":"utbb","amount":"33333333"},"validator_type":0}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'partner1':
Response:
  TxHash: 73B9D0D25C72935705ACBF3046BE44B3E0FCE769607D0F7EF629E01E2E11376F

```

```json
 {
 	"height": "10951",
 	"txhash": "73B9D0D25C72935705ACBF3046BE44B3E0FCE769607D0F7EF629E01E2E11376F",
 	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
 	"logs": [{
 		"msg_index": "0",
 		"success": true,
 		"log": ""
 	}],
 	"gas_wanted": "200000",
 	"gas_used": "122280",
 	"tags": [{
 		"key": "action",
 		"value": "create_validator"
 	}, {
 		"key": "destination-validator",
 		"value": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy"
 	}, {
 		"key": "moniker",
 		"value": "partner1"
 	}, {
 		"key": "identity"
 	}],
 	"tx": {
 		"type": "auth/StdTx",
 		"value": {
 			"msg": [{
 				"type": "lambda/MsgCreateValidator",
 				"value": {
 					"description": {
 						"moniker": "partner1",
 						"identity": "",
 						"website": "",
 						"details": ""
 					},
 					"commission": {
 						"rate": "0.250000000000000000",
 						"max_rate": "0.250000000000000000",
 						"max_change_rate": "0.010000000000000000"
 					},
 					"min_self_delegation": "33333333",
 					"delegator_address": "lambda1h7pnxzejqtzlfcad89hkn0ersjqmfsj89re3ks",
 					"validator_address": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy",
 					"pubkey": "lambdavalconspub1zcjduepq8qu9rg2srwxq9ze202pk6u8594e55mz909kuup3czr0mqvlfjjlslea3cn",
 					"value": {
 						"denom": "utbb",
 						"amount": "33333333"
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
 					"value": "Aox9v9VqOEZcYHFLxTRVYO+fWqD3qIETg1hzfx7x0o5g"
 				},
 				"signature": "E5kK/31D1femJ/20W1Sp7k/xETHzhmcNXDl59oFkUKAiYTq8OMZ2WiMXh/nhX7V3E1vtjv+wucTwrv1fblpZWg=="
 			}],
 			"memo": ""
 		}
 	},
 	"timestamp": "2019-08-21T12:20:12Z"
 }
```