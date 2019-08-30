# lambdacli query staking delegation 

## Description

Query delegations for an individual delegator on an individual partner validator

## Usage

```
lambdacli query staking partner-delegation <delegator-address> <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking partner-delegation -h
```

## Examples

Query a partner-delegation
```
lambdacli query staking partner-delegation lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7 lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy
```

After that, you will get detailed info of the delegation between specified validator and delegator.

```txt
Delegation:
  Delegator: lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
  Validator: lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy
  Shares:    100000.000000000000000000
```
