# lambdacli query distr slashes

## Description

Query all slashes of a validator for a given block range

## Usage:

```
 lambdacli query distr slashes <validator-address> <start-height> <end-height> [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help     |        | False    |                       | help for account                                             |
| --height       | Int    | False    |                       | Block height to query, omit to get most recent provable block|
| --ledger       | String | False    |                       | Use a connected Ledger device                                |
| --node         | String | False    | tcp://localhost:26657 | `<host>:<port>`to tendermint rpc interface for this chain    |
| --trust-node   | String | False    | True                  | Don't verify proofs for responses                            |


## Examples
```$xslt
lambdacli query distr slashes lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70 0 100
Validator Slash Events:
```
​           
