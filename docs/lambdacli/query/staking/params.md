# lambdacli query staking params

## Description

Query values set as staking parameters

## Usage

```
lambdacli query staking params [flags]
```

Print help messages:
```
lambdacli query staking params -h
```

## Examples

Query the current staking parameters information
```
lambdacli query staking params
```

After that, you will get the current staking parameters information.

```txt
Params:
  Unbonding Time:                          72h0m0s
  Max Validators:                          100
  Max Entries:                             7
  Bonded Coin Denom:                       utbb
  Partner validator min-self-delegation:   33333333
  Consensus validator min-self-delegation: 666666666
  Partner validator min-delegation:   	   100000
  Consensus validator min-delegation:      1000000
  Consensus validator commission rate:     0.250000000000000000
  Partner validator commission rate:       0.250000000000000000
  Supply Coin Denom:                       ulamb
```