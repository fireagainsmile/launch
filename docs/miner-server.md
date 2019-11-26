# Lambda Miner Server User Guide

## Basic Functionality Description

1. Provide restful APIs for storage machines
2. Fetch and dispatch tasks

## Usage

Assuming we have set `lambdacli` config properly(`trust-node`, `node`, `chain-id` etc)

```bash
./lambdacli miner-server --from [miner]
```

Run miner-server daemonize (--daemonize ) and put the log in ./minerserver.log  (--log.file=[path])

```bash
./lambdacli miner-server --from [miner] --daemonize --log.file=./minerserver.log
```

Stop miner-server daemon

```bash
./lambdacli miner-server --stop
```


## Flags

Name, shorthand | Default | Description | Required
:- | :- | :- | :-
--cors | | Set the domains that can make CORS requests |
--indent | | Add indent to JSON response |
--laddr | tcp://localhost:1317 | The address for the server to listen on |
--ledger | | Use a connected Ledger device |
--max-open | 1000 | The number of maximum open connections |
--node | tcp://localhost:26657 | [host]:[port] to tendermint rpc interface for this chain |
--trust-node | | Trust connected full node (don't verify proofs for responses) |
--chain-id | | Chain ID of tendermint node |
--broadcast-mode | block | Transaction broadcasting mode |
--dry-run | | ignore the --gas flag and perform a simulation of a transaction, but don't broadcast it |
--fees | | Fees to pay along with transaction; eg: 10ulamb |
--from | | Name or address of private key with which to sign | true
--gas | | gas limit to set per-transaction; set to "auto" to calculate required gas automatically (default 200000) (default "200000") |
--gas-prices | |  Gas prices to determine the transaction fee (e.g. 1.0ulamb) |
--query-interval | | The miner query task interval(second), minimum query interval is 5s (default 15) |
--daemonize | | run miner server daemon  |
--stop | | stop miner server daemon |
--status | | get miner server daemon status |
--log.file | | miner-server daemon log file path |

## REST APIs

Here we just list all APIs and introduce their functionality briefly.

- `GET /miner/match_order/{machineName}/{orderID}`: Get a match order by the given machine name and order id
- `GET /miner/tasks/{machineName}`: Get current avaiable mining challenge tasks by the given machine name

- `POST /miner/pdp_statement`: Sign and broadcast storage mining statment
- `POST /miner/pdp_proof`: Collects submitted pdp proofs, sign and broadcast it 


