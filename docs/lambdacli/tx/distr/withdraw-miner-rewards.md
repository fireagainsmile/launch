# lambdacli tx distr withdraw-miner-rewards

## Description

Withdraw miner rewards

## Usage

```
lambdacli tx distr withdraw-miner-rewards --from mykey
```

Print help messages:

```
lambdacli tx distr withdraw-miner-rewards -h
```

## Unique Flags

| Name, shorthand       | type   | Required | Default  | Description                                                         |
| --------------------- | -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from       |        | string     |                       |  Name or address of private key with which to sign                                        |

Keep in mind, don't specify the above options both.

## Examples
```
./lambdacli tx distr withdraw-miner-rewards --from m_2 --broadcast-mode block -y
Response:
  Height: 60
  TxHash: 96136C138469395D4072E390FEFEC8A391073C3562BA78C170273894B83CD9E2
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 21156
  Tags:
    - action = withdraw_miner_rewards
    - address = lambda1kkcjyek6a8yyaukngqqmm0rtqr2lk4gxhvkpmv
    - miner_rewards = 193974459ulamb
    - miner = lambdamineroper1kkcjyek6a8yyaukngqqmm0rtqr2lk4gxrr6xw3
```

```json
{
    "height":"60",
    "txhash":"96136C138469395D4072E390FEFEC8A391073C3562BA78C170273894B83CD9E2",
    "raw_log":"[{"msg_index":"0","success":true,"log":""}]",
    "logs":[
        {
            "msg_index":"0",
            "success":true,
            "log":""
        }
    ],
    "gas_wanted":"200000",
    "gas_used":"21156",
    "tags":[
        {
            "key":"action",
            "value":"withdraw_miner_rewards"
        },
        {
            "key":"address",
            "value":"lambda1kkcjyek6a8yyaukngqqmm0rtqr2lk4gxhvkpmv"
        },
        {
            "key":"miner_rewards",
            "value":"193974459ulamb"
        },
        {
            "key":"miner",
            "value":"lambdamineroper1kkcjyek6a8yyaukngqqmm0rtqr2lk4gxrr6xw3"
        }
    ],
    "tx":{
        "type":"auth/StdTx",
        "value":{
            "msg":[
                {
                    "type":"lambda/MsgWithdrawMinerRewards",
                    "value":{
                        "miner_address":"lambdamineroper1kkcjyek6a8yyaukngqqmm0rtqr2lk4gxrr6xw3"
                    }
                }
            ],
            "fee":{
                "amount":null,
                "gas":"200000"
            },
            "signatures":[
                {
                    "pub_key":{
                        "type":"tendermint/PubKeySecp256k1",
                        "value":"AiivENf1l36YhzM7g6YuJP3rEnyKhIzbC8vzM1MnQVNF"
                    },
                    "signature":"Hxg3GjK7TUvzVmAouhEiZL6LwwhF1xgJFasuIn46Y/NO0YdCCH8tSGEmjozG08Pbj0GrYnSdx2ClbdSKA2SQ+g=="
                }
            ],
            "memo":""
        }
    },
    "timestamp":"2020-04-14T13:37:52Z"
}
```