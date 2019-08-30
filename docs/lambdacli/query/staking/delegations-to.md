# lambdacli query staking delegations-to

## Description

Query delegations on an individual validator

## Usage

```
lambdacli query staking delegations-to <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking delegations-to -h
```

## Examples

Query all delegations to one validator
```
lambdacli query staking delegations-to lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
```

After that, you will get all detailed info of delegations from the specified delegator address.

```
Delegation:
  Delegator: lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
  Validator: lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Shares:    1000000.000000000000000000
Delegation:
  Delegator: lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9
  Validator: lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Shares:    1000000000.000000000000000000
```
