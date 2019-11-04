# lambdacli query

## Introduction

query module provides a set of subcommands to query block tx validator.

## Usage

```
lambdacli query <subcommand>
```

Print all supported subcommands and flags:
```
lambdacli query --help
```

## Available Commands

| Name                            | Description                                                   |
| --------------------------------| --------------------------------------------------------------|
| [block](block.md)     | Get verified data for a the block at given height                                     |
| [txs](txs.md)     | Search for paginated transactions that match a set of tags     |
| [tx](tx.md)   | Find a transaction by hash in a committed block                 |
| [account](account.md)   | Query account balance                 |
| [distr](./distr/README.md)   |  Querying commands for the distribution module                |
| [staking](./staking/README.md)   |  Querying commands for the staking module                                          |
| [minting](./minting/README.md)   |  Querying commands for the minting module                                         |
| [slashing](./slashing/README.md)                   | Querying commands for the slashing module                                           |
| [asset](asset/README.md)                             |  Querying commands for the asset module                                            |
| [gov](./gov/README.md)                             |  Querying commands for the gov module                                            |
| [market](market/README.md)                             |  Querying commands for the market module                                            |

