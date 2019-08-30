# lambdacli query staking partner-delegations-to

## Description

Query delegations on an individual partner validator

## Usage

```
lambdacli query staking partner-delegations-to <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking partner-delegations-to -h
```

## Examples

Query all delegations to one validator
```
lambdacli query staking partner-delegations-to lambdavaloper1jvxeas5axsuk5k94y9a2hc0wunz0gk3c2lzjyu
```

After that, you will get all detailed info of delegations from the specified delegator address.

```
Delegation:
  Delegator: lambda1jvxeas5axsuk5k94y9a2hc0wunz0gk3cumte7g
  Validator: lambdavaloper1jvxeas5axsuk5k94y9a2hc0wunz0gk3c2lzjyu
  Shares:    100000000.000000000000000000
Delegation:
  Delegator: lambda16nhfl0fup9cp65kaswsq0rlwnjk8sez4fv3ce4
  Validator: lambdavaloper1jvxeas5axsuk5k94y9a2hc0wunz0gk3c2lzjyu
  Shares:    100000.000000000000000000
```
