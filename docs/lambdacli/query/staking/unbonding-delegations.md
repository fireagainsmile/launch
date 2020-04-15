# lambdacli query staking unbonding-delegations

## Description

Query all unbonding-delegations records for one delegator

## Usage

```
lambdacli query staking unbonding-delegations [delegator-addr] [flags]
```

Print help messages:
```
lambdacli query staking unbonding-delegations -h
```

## Examples

Query all unbonding-delegations records
```
./lambdacli query staking unbonding-delegations lambda1vhp5rl39hmd9p8ah040zqvhmhlxv4gz2m8qegw  -o json --indent
```

After that, you will get unbonding delegation's detailed info by specified delegator.

```txt
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
