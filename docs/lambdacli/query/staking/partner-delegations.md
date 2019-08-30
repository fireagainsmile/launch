# lambdacli query staking partner-delegations

## Description

Query delegations for an individual delegator on all partner validators

## Usage
```
lambdacli query staking partner-delegations <delegator-address> [flags]
```

Print help messages:
```
lambdacli query staking partner-delegations -h
```

## Examples

Query all partner-delegations delegated from one delegator
```
lambdacli query staking delegations lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
```

After that, you will get all detailed info of delegations from the specified delegator address.

```
Delegation:
  Delegator: lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7
  Validator: lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy
  Shares:    100000.000000000000000000
```
