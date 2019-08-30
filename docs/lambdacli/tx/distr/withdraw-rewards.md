# lambdacli tx distr withdraw-rewards

## Description

Withdraw rewards

## Usage

```
lambdacli tx distr withdraw-rewards <validator-addr> <flags>
```

Print help messages:

```
lambdacli tx distr withdraw-rewards <validator-addr> -h
```

## Unique Flags

| Name, shorthand       | type   | Required | Default  | Description                                                         |
| --------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from       |        | string     |                       |  Name or address of private key with which to sign                                        |

Keep in mind, don't specify the above options both.

## Examples
```$xslt
./lambdacli tx distr withdraw-rewards lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy --from peter
{"chain_id":"lambda-test","account_number":"2","sequence":"12","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"cosmos-sdk/MsgWithdrawDelegationReward","value":{"delegator_address":"lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7","validator_address":"lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'peter':
Response:
  TxHash: 16B7AC2CE57C009D5B6BB6DF2754BF20A29DD721E0F3981F60A1A9A8DF8D2741
```

```json
{
	"height": "12418",
	"txhash": "16B7AC2CE57C009D5B6BB6DF2754BF20A29DD721E0F3981F60A1A9A8DF8D2741",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "60531",
	"tags": [{
		"key": "action",
		"value": "withdraw_delegator_reward"
	}, {
		"key": "rewards",
		"value": "310ulamb"
	}, {
		"key": "delegator",
		"value": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7"
	}, {
		"key": "source-validator",
		"value": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy"
	}],
	"tx": {
		"type": "auth/StdTx",
		"value": {
			"msg": [{
				"type": "cosmos-sdk/MsgWithdrawDelegationReward",
				"value": {
					"delegator_address": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7",
					"validator_address": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy"
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
				"signature": "rmR7Lk9tN49atzuhnjz/DH4x+F6eJ3MaS/ECY0sFedh3357p4CRTXMZpeaqFOybYhquCis8unr8c4VozAipN6g=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-22T03:47:03Z"
}
```