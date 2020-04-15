# lambdacli query block

## Introduction

Get verified data for a the block at given height

## Usage

```
lambdacli query block <height> <flags>
```

Print query block flags:
```
lambdacli query block --help
```

## Examples
```
lambdacli query block 8888
```

output

```json
{
	"block_meta": {
		"block_id": {
			"hash": "2043B3425488FF562CCDE3869DFFACACFCB649F5F0CB820F9E1369172233D31A",
			"parts": {
				"total": "1",
				"hash": "6C4962188A01B09CB9E413BD954F8C6897E38F48E3A6D29E631D489A25169534"
			}
		},
		"header": {
			"version": {
				"block": "10",
				"app": "0"
			},
			"chain_id": "lambda-test",
			"height": "8888",
			"time": "2019-08-21T09:25:46.694799Z",
			"num_txs": "0",
			"total_txs": "15",
			"last_block_id": {
				"hash": "1D3D2E1ECA129AA5997DEDEBB76665AF830338526CE87B1BDF820AE99492D040",
				"parts": {
					"total": "1",
					"hash": "817F45E64C73527987713F3880C4F90BAD466EFAEB3878B9436C1B910A4C15BB"
				}
			},
			"last_commit_hash": "1E4FC55C355F9CE6F6ABF022477890466AA377AF4D1B601CA865D86109513C3B",
			"data_hash": "",
			"validators_hash": "A3A813C132CD6AD09EB501763CE5317E2152A43B8AD4CDC130E7DAAE137E629E",
			"next_validators_hash": "A3A813C132CD6AD09EB501763CE5317E2152A43B8AD4CDC130E7DAAE137E629E",
			"consensus_hash": "048091BC7DDC283F77BFBF91D73C44DA58C3DF8A9CBC867405D8B7F3DAADA22F",
			"app_hash": "4894576D0D2ADCA661EAADDB74056021362084409C96B298FDB06D8B34F8575B",
			"last_results_hash": "",
			"evidence_hash": "",
			"proposer_address": "723152C0423B2DB995E822AA59D00139AB4A2D68"
		}
	},
	"block": {
		"header": {
			"version": {
				"block": "10",
				"app": "0"
			},
			"chain_id": "lambda-test",
			"height": "8888",
			"time": "2019-08-21T09:25:46.694799Z",
			"num_txs": "0",
			"total_txs": "15",
			"last_block_id": {
				"hash": "1D3D2E1ECA129AA5997DEDEBB76665AF830338526CE87B1BDF820AE99492D040",
				"parts": {
					"total": "1",
					"hash": "817F45E64C73527987713F3880C4F90BAD466EFAEB3878B9436C1B910A4C15BB"
				}
			},
			"last_commit_hash": "1E4FC55C355F9CE6F6ABF022477890466AA377AF4D1B601CA865D86109513C3B",
			"data_hash": "",
			"validators_hash": "A3A813C132CD6AD09EB501763CE5317E2152A43B8AD4CDC130E7DAAE137E629E",
			"next_validators_hash": "A3A813C132CD6AD09EB501763CE5317E2152A43B8AD4CDC130E7DAAE137E629E",
			"consensus_hash": "048091BC7DDC283F77BFBF91D73C44DA58C3DF8A9CBC867405D8B7F3DAADA22F",
			"app_hash": "4894576D0D2ADCA661EAADDB74056021362084409C96B298FDB06D8B34F8575B",
			"last_results_hash": "",
			"evidence_hash": "",
			"proposer_address": "723152C0423B2DB995E822AA59D00139AB4A2D68"
		},
		"data": {
			"txs": null
		},
		"evidence": {
			"evidence": null
		},
		"last_commit": {
			"block_id": {
				"hash": "1D3D2E1ECA129AA5997DEDEBB76665AF830338526CE87B1BDF820AE99492D040",
				"parts": {
					"total": "1",
					"hash": "817F45E64C73527987713F3880C4F90BAD466EFAEB3878B9436C1B910A4C15BB"
				}
			},
			"precommits": [{
				"type": 2,
				"height": "8887",
				"round": "0",
				"block_id": {
					"hash": "1D3D2E1ECA129AA5997DEDEBB76665AF830338526CE87B1BDF820AE99492D040",
					"parts": {
						"total": "1",
						"hash": "817F45E64C73527987713F3880C4F90BAD466EFAEB3878B9436C1B910A4C15BB"
					}
				},
				"timestamp": "2019-08-21T09:25:46.694799Z",
				"validator_address": "723152C0423B2DB995E822AA59D00139AB4A2D68",
				"validator_index": "0",
				"signature": "diyqnaMMBP1qU2oz/ypqxSV2abcScxuHGOFMPVZfUaLYO5QhUK+BEnw7/vAbyClRZ+d0fVYaqT6wPPe9/RcMDg=="
			}]
		}
	}
}
```

