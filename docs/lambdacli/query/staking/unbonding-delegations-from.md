# lambdacli query staking unbonding-from

## Description

Query all unbonding delegatations from a validator

## Usage

```
lambdacli query staking unbonding-delegations-from [validator-addr] [flags]
```

Print help messages:
```
lambdacli query staking unbonding-delegations-from --help
```

## Examples

Query all unbonding delegatations from a validator
```
./lambdacli query staking unbonding-delegations-from lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl -o json --indent
[
  {
    "delegator_address": "lambda1vhp5rl39hmd9p8ah040zqvhmhlxv4gz2m8qegw",
    "validator_address": "lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl",
    "entries": [
      {
        "creation_height": "25398",
        "completion_time": "2020-04-16T02:26:15.888571705Z",
        "initial_balance": "787000000",
        "balance": "787000000"
      }
    ]
  }
]
```
