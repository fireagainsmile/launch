# lambdacli tx unbond validator

## Introduction

Unbond illiquid tokens from a validator

## Usage

```
lambdacli tx staking unbond [validator-addr] [amount] --from peter
```

Print help messages:
```
lambdacli tx staking unbond --help
```

## Unique Flags

| Name, shorthand     | type   | Required | Default  | Description                                                         |
| --------------------| -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
lambdacli tx staking unbond lambdavaloper1gghjut3ccd8ay0zduzj64hwre2fxs9ldmqhffj 100utbb --from peter
```

Output:
Response:
  Height: 8
  TxHash: 9CB78B22D10192561AD77ACBBBED38F2CB6213FFC03B4B767ED6133DC0CDA9B1
  Data: 0C089DA8E6EC0510B0AFE1A901
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 113757
  Tags:
    - action = begin_unbonding
    - delegator = lambda1sg93x27wvmmtx2s3qr62enpyudkaj2tsd0hv9n
    - source-validator = lambdavaloper1sg93x27wvmmtx2s3qr62enpyudkaj2tsmt78l8
    - end-time = 2019-10-06T07:13:33Z
