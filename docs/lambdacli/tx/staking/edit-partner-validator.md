# lambdacli tx staking edit--partner-validator

## Introduction

Edit existing partner-validator, such as commission rate, name and other description message.

## Usage

```
lambdacli tx staking edit-partner-validator [flags]
```
Print help messages:
```
lambdacli tx staking edit-partner-validator --help
```

**tips**  

`commission-rate` is not support to change currently

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
lambdacli tx staking edit-partner-validator --commission-rate 0.11 --from partner1
```
Sample output:
```txt
{"chain_id":"lambda-test","account_number":"4","sequence":"3","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgEditValidator","value":{"moniker":"[do-not-modify]","identity":"[do-not-modify]","website":"[do-not-modify]","details":"[do-not-modify]","address":"lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy","commission_rate":"0.110000000000000000","min_self_delegation":null,"validator_type":0}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'partner1':
Response:
  TxHash: E1BB0882864E8172353A1C5F64BD542160DA4BDF37A44A1674F02339441D554C

```
```json
 "operator_address": "lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy",
     "consensus_pubkey": "lambdavalconspub1zcjduepq8qu9rg2srwxq9ze202pk6u8594e55mz909kuup3czr0mqvlfjjlslea3cn",
     "jailed": false,
     "status": 2,
     "tokens": "100000000",
     "delegator_shares": "100000000.000000000000000000",
     "description": {
       "moniker": "partner1",
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
       "update_time": "2019-08-21T12:20:12.118543Z"
     },
     "min_self_delegation": "100000000"
   }
```
