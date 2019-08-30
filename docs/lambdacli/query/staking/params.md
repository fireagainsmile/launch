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
  Unbonding Time:    72h0m0s
  Max Validators:    100
  Max Entries:       7
  Bonded Coin Denom: utbb
```