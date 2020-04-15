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
    "height":"59",
    "txhash":"EB3B5E042D1DB5937F4EB37E56A36C38C83DEBADAF87BB557618EC76DDCD66E4",
    "raw_log":"[{"msg_index":"0","success":true,"log":""}]",
    "logs":[
        {
            "msg_index":"0",
            "success":true,
            "log":""
        }
    ],
    "gas_wanted":"200000",
    "gas_used":"12942",
    "tags":[
        {
            "key":"action",
            "value":"set_withdraw_address"
        },
        {
            "key":"address",
            "value":"lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67"
        },
        {
            "key":"delegator",
            "value":"lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67"
        }
    ],
    "tx":{
        "type":"auth/StdTx",
        "value":{
            "msg":[
                {
                    "type":"cosmos-sdk/MsgModifyWithdrawAddress",
                    "value":{
                        "delegator_address":"lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67",
                        "withdraw_address":"lambda1a83p8s9gs5hua09xn5ktmahepst3vzg92wkp4e"
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
                        "value":"AgkVzNo/lgZz7G0xQT8L7aTCtbeGe4xzC6eJiCSD3iic"
                    },
                    "signature":"iciyxBdywX35Zsbqu3YCoRd9X+M4oXIyMewIzBcw2+gaMvREDgqcM0Q+nVxZEyM3cLuEXmBhX5BN1xTJ5FUx4A=="
                }
            ],
            "memo":""
        }
    },
    "timestamp":"2020-04-14T14:03:39Z"
}
```