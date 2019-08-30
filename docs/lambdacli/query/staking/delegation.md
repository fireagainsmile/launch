# lambdacli query staking delegation 

## Description

Query delegations for an individual delegator on an individual validator

## Usage

```
lambdacli query staking delegation <delegator-address> <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking delegation -h
```

## Examples

Query a delegation
```
lambdacli query staking delegation lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7 lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
```

After that, you will get detailed info of the delegation between specified validator and delegator.

```txt
Delegation:
  Delegator: lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
  Validator: lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Shares:    1000000.000000000000000000
```
