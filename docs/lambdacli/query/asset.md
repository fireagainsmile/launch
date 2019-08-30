# lambdacli query asset

## Introduction

Querying commands for the asset module 

## Usage

```
lambdacli query asset pledge <address> [flags]
lambdacli query asset pool-tokens 
```

Print query block flags:
```
lambdacli query asset --help
```

## flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help     |        | False    |                       | help for account                                             |
| --height       | Int    | False    |                       | Block height to query, omit to get most recent provable block|
| --ledger       | String | False    |                       | Use a connected Ledger device                                |
| --node         | String | False    | tcp://localhost:26657 | `<host>:<port>`to tendermint rpc interface for this chain    |
| --trust-node   | String | False    | True                  | Don't verify proofs for responses                            |

## Examples

### Query asset pledges from address

```$xslt
lambdacli query asset pledge lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9

Pledge:
  Address: lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9
  Asset: 202001000utbb
  Token: 202001000000ulamb
```

### Query the asset pool tokens amount
```$xslt
lambdacli query asset pool-tokens
                                         
Pool:
  Bonded Coins: 202001000000ulamb

```

