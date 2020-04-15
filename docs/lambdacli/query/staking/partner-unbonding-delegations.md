# lambdacli query staking partner-unbonding-delegations

## Description

Query delegations for an individual delegator on all partner validators

## Usage

```
lambdacli query staking partner-unbonding-delegations <delegator-address> [flags]
```

Print help messages:
```
lambdacli query staking partner-unbonding-delegations -h
```

## Examples

Query delegations for an individual delegator
```
./lambdacli query staking partner-unbonding-delegations lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67 -o json --indent
```

After that, you will get unbonding delegation's detailed info with specified delegator.

```txt
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
