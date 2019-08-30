# lambdacli tx distr withdraw-all-rewards

## Description

Withdraw all rewards

## Usage

```
lambdacli tx distr withdraw-all-rewards --from <name>
```

## Examples

```
lambdacli tx distr withdraw-all-rewards --from peter 
```

Example response:
```json
{
	"height": "12467",
	"txhash": "2C9E1CCA299054BBE771BBAE256C890B18BF3096261E63C899E78FAF665545A9",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"},{\"msg_index\":\"1\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}, {
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "112718",
	"tags": [{
		"key": "action",
		"value": "withdraw_delegator_reward"
	}, {
		"key": "rewards",
		"value": "5357ulamb"
	}, {
		"key": "delegator",
		"value": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7"
	}, {
		"key": "source-validator",
		"value": "lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3"
	}, {
		"key": "action",
		"value": "withdraw_delegator_reward"
	}, {
		"key": "rewards",
		"value": "76ulamb"
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
					"validator_address": "lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3"
				}
			}, {
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
				"signature": "h25EBVA1069jPt/ezGb5Zw2F4SRlCpbHGPztQoYkfi9uFsTX/vVz6efDLJyI/jmhqjmXzhuu6nWQ9kl1H3+c7A=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-22T03:51:11Z"
}
```