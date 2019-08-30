# lambdacli query staking validators

## Description

Query details about all validators on a network:

## Usage

```
lambdacli query staking validators [flags]
```

Print help messages:
```
lambdacli query staking validators --help
```

## Examples

Query for all validators
```
lambdacli query staking validators
```

After that, you will get all validators' info.

```txt
Validator
  Operator Address:           lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Validator Consensus Pubkey: lambdavalconspub1zcjduepqyvh353wz7vpg505js0v34e85d59jzatfuu2c63rltrz6492xww7s30udf5
  Jailed:                     false
  Status:                     Bonded
  Tokens:                     1001000000
  Delegator Shares:           1001000000.000000000000000000
  Description:                {mtest   }
  Unbonding Height:           0
  Unbonding Completion Time:  1970-01-01 00:00:00 +0000 UTC
  Minimum Self Delegation:    1000000000
  Commission:                 rate: 0.110000000000000000, maxRate: 0.200000000000000000, maxChangeRate: 0.010000000000000000, updateTime: 2019-08-21 08:55:25.720033 +0000 UTC
```
