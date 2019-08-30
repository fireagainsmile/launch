# lambdacli query staking partner-unbonding-delegation

## Description

Query partner unbonding delegations for an individual delegator on an individual partner validator

## Usage

```
lambdacli query staking partner-unbonding-delegation <delegator-address> <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking artner-unbonding-delegation -h
```

## Examples

Query an partner-unbonding-delegation
```
lambdacli query staking partner-unbonding-delegation lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7 lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
```

After that, you will get unbonding delegation's detailed info between specified validator and delegator.

```txt
Unbonding Delegations between:
  Delegator:                 lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
  Validator:                 lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Entries:    Unbonding Delegation 0:
  Creation Height:           19871
  Min time to unbond (unix): 2019-08-26 03:06:32.063723 +0000 UTC
  Expected balance:          100000
```
