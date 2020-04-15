# lambdacli query slashing signing-info 

## Description

Use a validators' consensus public key to find the signing-info for that validator

## Usage

```
lambdacli query slashing signing-info <validator-conspub> [flags]
```

Print help messages:
```
lambdacli query slashing signing-info -h
```

## Examples
Fisrt, use `lambdacli keys show [val-name] --bech val` to get validator operator address 
``` 
./lambdacli keys show testnet1 --bech val
NAME:	TYPE:	ADDRESS:					PUBKEY:
testnet1	local	lambdavaloper1a83p8s9gs5hua09xn5ktmahepst3vzg9u2l20d	lambdavaloperpub1addwnpepqvc29jajdssfxh4l6j5kmu7jy8g7mwews6k7yk2wktat3dr0c8hmsz78jga
```
Second, use `lambdacli query staking validator`  to get `Validator Consensus Pubkey` with specified validator operator address
``` 
./lambdacli query staking validator lambdavaloper1a83p8s9gs5hua09xn5ktmahepst3vzg9u2l20d
Validator
  Operator Address:           lambdavaloper1a83p8s9gs5hua09xn5ktmahepst3vzg9u2l20d
  Validator Consensus Pubkey: lambdavalconspub1zcjduepqdwjlhfaqsyf8en004r69zuvjg0hehqxn08mjevcn7hmjcwptktzsuyavj5
  Jailed:                     false
  Status:                     Bonded
  Tokens:                     1749666666
  Delegator Shares:           1749666666.000000000000000000
  Description:                {cv-moniker-1   }
  Unbonding Height:           0
  Unbonding Completion Time:  1970-01-01 00:00:00 +0000 UTC
  Minimum Self Delegation:    666666666
  Commission:                 rate: 0.250000000000000000, maxRate: 0.250000000000000000, maxChangeRate: 0.010000000000000000, updateTime: 2020-03-03 02:04:52.380174219 +0000 UTC

```
And then, you can get signing-info for the validator
```
./lambdacli query slashing signing-info lambdavalconspub1zcjduepqdwjlhfaqsyf8en004r69zuvjg0hehqxn08mjevcn7hmjcwptktzsuyavj5
Start Height:          0
Index Offset:          599655
Jailed Until:          1970-01-01 00:00:00 +0000 UTC
Tombstoned:            false
Missed Blocks Counter: 0
```
