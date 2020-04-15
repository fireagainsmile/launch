# lambdacli query staking partner-unbonding-delegations

## Description
Query all unbonding delegatations from a partner validator

## Usage

```
lambdacli query staking partner-unbonding-delegations-from [validator-addr] [flags]
```

Print help messages:
```
lambdacli query staking partner-unbonding-delegations-from --help
```

## Examples
Query all unbonding delegatations from a partner validator
```
/lambdacli query staking partner-unbonding-delegations-from lambdavaloper1lhv2m2hxnlp47d4nkqutgqcz26atpa4cg3ftyd -o json --indent
[
  {
    "delegator_address": "lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67",
    "validator_address": "lambdavaloper1lhv2m2hxnlp47d4nkqutgqcz26atpa4cg3ftyd",
    "entries": [
      {
        "creation_height": "55",
        "completion_time": "2020-04-17T14:03:19.508097739Z",
        "initial_balance": "1",
        "balance": "1"
      }
    ]
  }
]
```
