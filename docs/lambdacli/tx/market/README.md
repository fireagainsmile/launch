# lambdacli market

## Introduction

market module provides a set of subcommands to send market transactions.

## Usage

```
lambdacli tx market <subcommand>
```

Print all supported subcommands and flags:
```
lambdacli tx market --help
```

## Available Commands

| Name                            | Description                                                   |
| --------------------------------| --------------------------------------------------------------|
| [create-market](create-market.md)                       | Create new market actor                                |
| [edit-market](edit-market.md)                       | edit market actor                                |
| [withdraw-market](withdraw-market.md)                           | withdraw market income                                                           |
| [create-miner](create-miner.md)                           | create miner actor                                                         |
| [create-machine](create-machine.md)                                       | create machine below miner                                                         |
| [edit-machine](edit-machine.md)                                       | edit machine info                                                       |
| [create-sellorder](create-sellorder.md)                                   | create a sell order by miner                                      |
| [cancel-order](cancel-order.md)                                   | cancel a sell order by miner                                      |
| [create-buyorder](create-buyorder.md)                                   | create a buy order by user                                     |
| [withdraw-miner](withdraw-miner.md)                                   | withdraw a match order reward                                     |
| [miner-withdraw-machine](miner-withdraw-machine.md)                                   | withdraw match orders below machine get reward                                      |

