# lambdacli tx staking edit-validator

## Introduction

Edit existing validator, such as commission rate, name and other description message.

## Usage

```
lambdacli tx staking edit-validator [flags]
```
Print help messages:
```
lambdacli tx staking edit-validator --help
```


## Unique Flags

| Name, shorthand     | type   | Required | Default  | Description                                                         |
| --------------------| -----  | -------- | -------- | ------------------------------------------------------------------- |
| --commission-rate   | string | float    | 0.0      | Commission rate percentage |
| --moniker           | string | false    | ""       | Validator name |
| --identity          | string | false    | ""       | Optional identity signature (ex. UPort or Keybase) |
| --website           | string | false    | ""       | Optional website  |
| --details           | string | false    | ""       | Optional details |


## Examples

```
lambdacli tx staking edit-validator --commission-rate 0.11 --from master
```
Sample output:
```txt
{"chain_id":"lambda-test","account_number":"0","sequence":"26","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgEditValidator","value":{"moniker":"[do-not-modify]","identity":"[do-not-modify]","website":"[do-not-modify]","details":"[do-not-modify]","address":"lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3","commission_rate":"0.120000000000000000","min_self_delegation":null,"validator_type":1}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  TxHash: 13A07A590FD6A7609FB034B3CDD0E43EAC2CE97AD4AD4DDA03D64CF09B922CE6

```
```json
 {
    "operator_address": "lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3",
    "consensus_pubkey": "lambdavalconspub1zcjduepqyvh353wz7vpg505js0v34e85d59jzatfuu2c63rltrz6492xww7s30udf5",
    "jailed": false,
    "status": 2,
    "tokens": "1001000000",
    "delegator_shares": "1001000000.000000000000000000",
    "description": {
      "moniker": "mtest",
      "identity": "",
      "website": "",
      "details": ""
    },
    "unbonding_height": "0",
    "unbonding_time": "1970-01-01T00:00:00Z",
    "commission": {
      "rate": "0.110000000000000000",
      "max_rate": "0.200000000000000000",
      "max_change_rate": "0.010000000000000000",
      "update_time": "2019-08-21T08:55:25.720033Z"
    },
    "min_self_delegation": "1000000000"
  }
```
