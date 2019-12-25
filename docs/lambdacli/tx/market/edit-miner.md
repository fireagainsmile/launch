# lambdacli tx market edit-miner

## Introduction

Send transaction to edit a miner

## Usage

``
lambdacli tx market edit-miner [flags]
```

Print help messages:
```
lambdacli tx market edit-miner -h
```

## Unique Flags

| Name, shorthand   | type   | Required | Default  | Description                                                         |
| ----------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --dht-id          | string | false    | ""       | modify dht id value |
| --mining-address  | string | false    | ""       | modify mining address |
| --from            | string | true     | ""       | Name or address of private key with which to sign |

## Examples

```
./lambdacli tx market edit-miner --mining-address lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7 --from song --broadcast-mode block

```

Sample Output:
```txt
{"chain_id":"songtest","account_number":"2","sequence":"9","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgEditMiner","value":{"address":"lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw","dhtId":"[do-not-modify]","miningAddress":"lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'song':
Response:
  Height: 1402
  TxHash: AEEB0530DB838025B1A6A7508DD0CA5F97B8DF9B0D2BC8585123FE5641E01A71
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 27102
  Tags: 
    - action = editMiner
    - address = lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw
    - miningAddress = lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7

```

```json
 {
   "height": "1402",
   "txhash": "AEEB0530DB838025B1A6A7508DD0CA5F97B8DF9B0D2BC8585123FE5641E01A71",
   "raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
   "logs": [
     {
       "msg_index": "0",
       "success": true,
       "log": ""
     }
   ],
   "gas_wanted": "200000",
   "gas_used": "27102",
   "tags": [
     {
       "key": "action",
       "value": "editMiner"
     },
     {
       "key": "address",
       "value": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw"
     },
     {
       "key": "miningAddress",
       "value": "lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7"
     }
   ],
   "tx": {
     "type": "auth/StdTx",
     "value": {
       "msg": [
         {
           "type": "lambda/MsgEditMiner",
           "value": {
             "address": "lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw",
             "dhtId": "[do-not-modify]",
             "miningAddress": "lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7"
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
           "signature": "HY9AfuIoWF8PqP1JIV4Sw7JeZluzJP8weP9W0MvPHUVJ9kbnakHzkr8YlT8/7RsSZQfURSQoqn01BlFTVrwF+A=="
         }
       ],
       "memo": ""
     }
   },
   "timestamp": "2020-03-20T10:50:26Z"
 }

```
