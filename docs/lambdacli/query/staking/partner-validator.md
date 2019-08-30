# lambdacli query staking partner-validator

## Description

Query details about an individual partner validator

## Usage

```
lambdacli query staking partner-validator <validator-address> [flags]
```

Print help messages:
```
lambdacli query staking partner-validator -h
```

## Examples

Query a partner-validator
```
lambdacli query staking partner-validator lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3 
```

After that, you will get the specified validator's info.

```txt
Validator
  Operator Address:           lambdavaloper1h7pnxzejqtzlfcad89hkn0ersjqmfsj8n8s6vy
  Validator Consensus Pubkey: lambdavalconspub1zcjduepq8qu9rg2srwxq9ze202pk6u8594e55mz909kuup3czr0mqvlfjjlslea3cn
  Jailed:                     false
  Status:                     Bonded
  Tokens:                     100100000
  Delegator Shares:           100100000.000000000000000000
  Description:                {partner1   }
  Unbonding Height:           0
  Unbonding Completion Time:  1970-01-01 00:00:00 +0000 UTC
  Minimum Self Delegation:    100000000
  Commission:                 rate: 0.100000000000000000, maxRate: 0.200000000000000000, maxChangeRate: 0.010000000000000000, updateTime: 2019-08-21 12:20:12.118543 +0000 UTC
```
