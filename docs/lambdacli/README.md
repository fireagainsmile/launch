# Command Line Client

## Global flags of query commands

All query commands has these global flags. Their unique flags will be introduced later.

| Name, shorthand | type   | Required | Default Value         | Description                                                          |
| --------------- | ----   | -------- | --------------------- | -------------------------------------------------------------------- |
| --chain-id      | string | false    | ""                    | Chain ID of tendermint node |
| --height        | int    | false    | 0                     | Block height to query, omit to get most recent provable block |
| --help, -h      | string | false    |                       | Print help message |
| --output        | string | false    | text                  | Response format text or json|
| --indent        | bool   | false    | false                 | Add indent to JSON response |
| --ledger        | bool   | false    | false                 | Use a connected Ledger device |
| --node          | string | false    | tcp://localhost:26657 | \<host>:\<port> to tendermint rpc interface for this chain |
| --trust-node    | bool   | false    | true                  | Don't verify proofs for responses |

### Json indent response

`output` specify the output format of the query:

Not specified, return text format as default：

```
$ ./lambdacli query staking validators
Validator
  Operator Address:           lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3
  Validator Consensus Pubkey: lambdavalconspub1zcjduepqyvh353wz7vpg505js0v34e85d59jzatfuu2c63rltrz6492xww7s30udf5
  Jailed:                     false
  Status:                     Bonded
  Tokens:                     1000000000
  Delegator Shares:           1000000000.000000000000000000
  Description:                {mtest   }
  Unbonding Height:           0
  Unbonding Completion Time:  1970-01-01 00:00:00 +0000 UTC
  Minimum Self Delegation:    1000000000
  Commission:                 rate: 0.100000000000000000, maxRate: 0.200000000000000000, maxChangeRate: 0.010000000000000000, updateTime: 2019-08-19 11:37:01.078013 +0000 UTC
```

Specify `output` and `indent`, return json indent format: 

```
$ ./lambdacli query staking validators --output=json --indent 
[
  {
    "operator_address": "lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3",
    "consensus_pubkey": "lambdavalconspub1zcjduepqyvh353wz7vpg505js0v34e85d59jzatfuu2c63rltrz6492xww7s30udf5",
    "jailed": false,
    "status": 2,
    "tokens": "1000000000",
    "delegator_shares": "1000000000.000000000000000000",
    "description": {
      "moniker": "mtest",
      "identity": "",
      "website": "",
      "details": ""
    },
    "unbonding_height": "0",
    "unbonding_time": "1970-01-01T00:00:00Z",
    "commission": {
      "rate": "0.100000000000000000",
      "max_rate": "0.200000000000000000",
      "max_change_rate": "0.010000000000000000",
      "update_time": "2019-08-19T11:37:01.078013Z"
    },
    "min_self_delegation": "1000000000"
  }
]
```

## Global flags of commands to send transactions

All commands which can be used to send transactions have these global flags. Their unique flags will be introduced later.

| Name, shorthand  | type   | Required | Default               | Description                                                         |
| -----------------| -----  | -------- | --------------------- | ------------------------------------------------------------------- |
| --account-number | int    | false    | 0                     | AccountNumber to sign the tx |
| --async          | bool   | false    | false                 | broadcast transactions asynchronously(only works with commit = false) |
| --commit         | bool   | false    | false                 | broadcast transaction and wait until the transaction is included by a block |
| --chain-id       | string | true     | ""                    | Chain ID of tendermint node  |
| --dry-run        | bool   | false    | false                 | Ignore the --gas flag and perform a simulation of a transaction, but don't broadcast it |
| --fee            | string | true     | ""                    | Fee to pay along with transaction |
| --from           | string | false    | ""                    | Name of private key with which to sign |
| --from-addr      | string | false    | ""                    | Specify from address in generate-only mode |
| --gas            | int    | false    | 50000                | Gas limit to set per-transaction; set to "simulate" to calculate required gas automatically |
| --gas-adjustment | int    | false    | 1.5                   | Adjustment factor to be multiplied against the estimate returned by the tx simulation; if the gas limit is set |
| --generate-only  | bool   | false    | false                 | Build an unsigned transaction and write it to STDOUT |
| --help, -h       | string | false    |                       | Print help message |
| --indent         | bool   | false    | false                 | Add indent to JSON response |
| --json           | string | false    | false                 | Return output in json format |
| --ledger         | bool   | false    | false                 | Use a connected Ledger device |
| --memo           | string | false    | ""                    | Memo to send along with transaction |
| --node           | string | false    | tcp://localhost:26657 | \<host>:\<port> to tendermint rpc interface for this chain |
| --print-response | bool   | false    | false                 | return tx response (only works with async = false)|
| --sequence       | int    | false    | 0                     | Sequence number to sign the tx |
| --trust-node     | bool   | false    | true                  | Don't verify proofs for responses | 

## Module command list

Each module provides a set of command line interfaces. Here we sort these commands by modules.

1. [status command](./status/README.md)
2. [query command](./query/README.md)
3. [tx command](./tx/README.md)
4. [keys command](./keys/README.md)
5. [version command](./version/README.md)

## Config command

The `lambdacli config` command interactively generate config.toml in `$HOME/.lambdacli/config` if you exec first time, you should give this some parameters example: chain-id, home, fee, and node.

Example：

```
$ ./lambdacli config trust-node true                          
$HOME/.lambdacli/config/config.toml does not exist
configuration saved to $HOME/.lambdacli/config/config.toml

$ ./lambdacli config
trust-node = true
```
