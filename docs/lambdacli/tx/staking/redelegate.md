# lambdacli tx staking redelegate

## Introduction

Transfer delegation from one validator to another.

## Usage

```
lambdacli tx staking redelegate [src-validator-addr] [dst-validator-addr] [amount] [flags]
```

Print help messages:

```
lambdacli tx staking redelegate --help
```

## Unique Flags

| Name, shorthand            | type   | Required | Default  | Description                                                         |
| -------------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
lambdacli tx staking redelegate \
    lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70 \
    lambdavaloper188xynycq7hq94ftntmv99m3jltqt5tkkgtvhc8 \
    1000000utbb \
    --from val1 \
    --broadcast-mode block \
```

Sample Output:
```txt
{"chain_id":"testing","account_number":"4","sequence":"1","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgBeginRedelegate","value":{"delegator_address":"lambda10gat77jd5ucz7gw0m3xac8jfj5l83r6cm5ufc0","validator_src_address":"lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70","validator_dst_address":"lambdavaloper188xynycq7hq94ftntmv99m3jltqt5tkkgtvhc8","amount":{"denom":"utbb","amount":"1000000"},"validator_type":1}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'val1':
Response:
  Height: 347
  TxHash: 712792D3AA2F7C59B94A3F32631BF16AA6B5BC8096025A89BF21E49AA0507A3C
  Data: 0C08D9908EEB051098E1DBD001
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 134912
  Tags:
    - action = begin_redelegate
    - delegator = lambda10gat77jd5ucz7gw0m3xac8jfj5l83r6cm5ufc0
    - source-validator = lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70
    - destination-validator = lambdavaloper188xynycq7hq94ftntmv99m3jltqt5tkkgtvhc8
    - end-time = 2019-08-26T07:20:57Z
```

```json
{
	"height": "347",
	"txhash": "712792D3AA2F7C59B94A3F32631BF16AA6B5BC8096025A89BF21E49AA0507A3C",
	"data": "0C08D9908EEB051098E1DBD001",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "134912",
	"tags": [{
		"key": "action",
		"value": "begin_redelegate"
	}, {
		"key": "delegator",
		"value": "lambda10gat77jd5ucz7gw0m3xac8jfj5l83r6cm5ufc0"
	}, {
		"key": "source-validator",
		"value": "lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70"
	}, {
		"key": "destination-validator",
		"value": "lambdavaloper188xynycq7hq94ftntmv99m3jltqt5tkkgtvhc8"
	}, {
		"key": "end-time",
		"value": "2019-08-26T07:20:57Z"
	}],
	"tx": {
		"type": "auth/StdTx",
		"value": {
			"msg": [{
				"type": "lambda/MsgBeginRedelegate",
				"value": {
					"delegator_address": "lambda10gat77jd5ucz7gw0m3xac8jfj5l83r6cm5ufc0",
					"validator_src_address": "lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70",
					"validator_dst_address": "lambdavaloper188xynycq7hq94ftntmv99m3jltqt5tkkgtvhc8",
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
					"value": "AyQgh+AR8NV22bf1e46cHWsx0R0AIGA4LnUoufq+UhcM"
				},
				"signature": "1ncNSNVOQEfKoBNeOv5FXPzQWqS0N01qAf5FwhRX4khUT9Hjcp2Jp+umCO+cNSSxl7Q2+7Swtqla9AZA3SvEHw=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-23T07:20:57Z"
}
```