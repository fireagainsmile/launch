# lambdacli query tx

## Introduction

Find a transaction by hash in a committed block.

## Usage

```
lambdacli query tx <hash> <flags>
```

Print query tx flags:
```
lambdacli query tx --help
```

## flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for txs                                        |

## Examples
```
lambdacli query tx 7EBE2CEB4102CA0D0183EE3511D484FCC717D90437990A716DEBA546C8506932 -o=output
```

output

```json
{
	"height": "14917",
	"txhash": "7EBE2CEB4102CA0D0183EE3511D484FCC717D90437990A716DEBA546C8506932",
	"raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
	"logs": [{
		"msg_index": "0",
		"success": true,
		"log": ""
	}],
	"gas_wanted": "200000",
	"gas_used": "24069",
	"tags": [{
		"key": "action",
		"value": "send"
	}, {
		"key": "sender",
		"value": "lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9"
	}, {
		"key": "recipient",
		"value": "lambda1ah8pfpnx00m75w07lajk7jsfaz4x780upxa3xx"
	}],
	"tx": {
		"type": "auth/StdTx",
		"value": {
			"msg": [{
				"type": "cosmos-sdk/MsgSend",
				"value": {
					"from_address": "lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9",
					"to_address": "lambda1ah8pfpnx00m75w07lajk7jsfaz4x780upxa3xx",
					"amount": [{
						"denom": "utbb",
						"amount": "10000000"
					}]
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
				"signature": "0QblWlAPIjhXtoNj1s84Gk2pg15jG2XWEdBmd35n9msITJskZ1dOcIK+F04r+YoSd7MGJYMirlrnGFuXMloiGA=="
			}],
			"memo": ""
		}
	},
	"timestamp": "2019-08-22T07:18:28Z"
}
```

