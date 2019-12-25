# lambdacli tx market miner-withdraw-count

## Introduction

Send transaction to withdraw orders

## Usage

```
lambdacli tx market miner-withdraw-count [page] [limit] [flags]

```

Print help messages:
```
lambdacli tx market miner-withdraw-count --help
```

## Unique Flags

| Name, shorthand   | type   | Required | Default  | Description                                                         |
| ----------------- | -----  | -------- | -------- | ------------------------------------------------------------------- | 
| --from            | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
 ./lambdacli tx market miner-withdraw-count 1 100 --from miner

```

Sample Output:
```txt
{"chain_id":"songtest","account_number":"2","sequence":"11","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgMinerWithDrawCount","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","page":"1","limit":"1"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'song':
Response:
  Height: 1521
  TxHash: AAED2CAC7FE886BBD4DEE7FDFB0414E525C0C3F216EDDB0C01D6B42E48914744
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 67673
  Tags: 
    - action = minerWithdrawCount
    - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
    - withdrawMiner = 0ulamb
    - allCount = 1
    - withDrawCount = 0
    - withDrawIdList = 
    - withDrawDetail = 5b7b226f726465724964223a2241343530323134444434393039463730384231464534424230393245463245424430443036373534222c226d696e6572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a2230227d2c2275736572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a2230227d7d5d
    - withdrawTime = 2020-03-20 10:52:25.478504 +0000 UTC

```

```json
 {
   "height": "1521",
   "txhash": "AAED2CAC7FE886BBD4DEE7FDFB0414E525C0C3F216EDDB0C01D6B42E48914744",
   "raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
   "logs": [
     {
       "msg_index": "0",
       "success": true,
       "log": ""
     }
   ],
   "gas_wanted": "200000",
   "gas_used": "67673",
   "tags": [
     {
       "key": "action",
       "value": "minerWithdrawCount"
     },
     {
       "key": "address",
       "value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
     },
     {
       "key": "withdrawMiner",
       "value": "0ulamb"
     },
     {
       "key": "allCount",
       "value": "1"
     },
     {
       "key": "withDrawCount",
       "value": "0"
     },
     {
       "key": "withDrawIdList"
     },
     {
       "key": "withDrawDetail",
       "value": "5b7b226f726465724964223a2241343530323134444434393039463730384231464534424230393245463245424430443036373534222c226d696e6572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a2230227d2c2275736572506179223a7b2264656e6f6d223a22756c616d62222c22616d6f756e74223a2230227d7d5d"
     },
     {
       "key": "withdrawTime",
       "value": "2020-03-20 10:52:25.478504 +0000 UTC"
     }
   ],
   "tx": {
     "type": "auth/StdTx",
     "value": {
       "msg": [
         {
           "type": "lambda/MsgMinerWithDrawCount",
           "value": {
             "address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
             "page": "1",
             "limit": "1"
           }
         }
       ],
       "fee": {
         "amount": null,
         "gas": "200000"
       },
       "signatures": [
         {
           "pub_key": {
             "type": "tendermint/PubKeySecp256k1",
             "value": "A10Y+N2g+ZxgJ0y+v1lqPoUJH3xvUc06Id0Jfxfa38rM"
           },
           "signature": "jB+YLmQ3SaNlQ/XO3g7+YgHJar9QiNH77DXWQPdXs8JfNqztZnP+gYL8OwH6VxKzDNsFR32Jpa+G384PBP/OPw=="
         }
       ],
       "memo": ""
     }
   },
   "timestamp": "2020-03-20T10:52:25Z"
 }

```
