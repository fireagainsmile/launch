# lambdacli query staking unbonding-delegation

## Description

Query an unbonding-delegation record based on delegator and validator address

## Usage

```
lambdacli query staking unbonding-delegation <delegator-address> <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking unbonding-delegation -h
```

## Examples

Query an unbonding-delegation
```
./lambdacli query staking unbonding-delegation lambda1vhp5rl39hmd9p8ah040zqvhmhlxv4gz2m8qegw lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl -o json --indent
```

After that, you will get unbonding delegation's detailed info between specified validator and delegator.

```txt
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
```
