# lambdacli query staking delegations

## Description

Query delegations for an individual delegator on all validators:

## Usage
```
lambdacli query staking delegations <delegator-address> [flags]
```

Print help messages:
```
lambdacli query staking delegations -h
```

## Examples

Query all delegations delegated from one delegator
```
lambdacli query staking delegations lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
```

After that, you will get all detailed info of delegations from the specified delegator address.

```
Delegation:
  Delegator: lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
  Validator: lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Shares:    1000000.000000000000000000
```
