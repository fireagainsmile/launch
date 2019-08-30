# lambdacli tx distr set-withdraw-addr

## Description

Set withdraw address for delegator

## Usage

```
lambdacli tx distr set-withdraw-addr <withdraw-addr> <flags>
```

Print help messages:
```
lambdacli tx distr set-withdraw-addr --help
```

## Examples

```
lambdacli tx distr set-withdraw-addr lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw --from peter
```

Example response:
```json
{
	"height": "12812",
	"txhash": "64852F3BD5F29A2BD32BE6608C4242BEFAB7D7CFF99035A1D242F036BDA30B9B",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "12678",
	"tags": [{
		"key": "action",
		"value": "set_withdraw_address"
	}, {
		"key": "delegator",
		"value": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7"
	}],
	"tx": {
		"type": "auth/StdTx",
		"value": {
			"msg": [{
				"type": "cosmos-sdk/MsgModifyWithdrawAddress",
				"value": {
					"delegator_address": "lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7",
					"withdraw_address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
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
				"signature": "qOHNpvvXlIEdQcQKgLXBxWyLhkAjR8MxPhhfm5FRNJh+zfZO/nYswmFConxeBWNpqwHYRw/zLmgBhQuoEDDEKg=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-22T04:20:23Z"
}
```