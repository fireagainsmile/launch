# lambdacli query staking

## Introduction

Querying commands for the staking module

## Usage

```
lambdacli query staking [command]
```

Print all supported subcommands and flags:
```
lambdacli query staking --help
```

## Available Commands

| Name                            | Description                                                   |
| --------------------------------| --------------------------------------------------------------|
| [validator](validator.md)       | Query a validator                                             |
| [validators](validators.md)     | Query for all validators                                      |
| [delegation](delegation.md)     | Query a delegation based on address and validator address     |
| [delegations](delegations.md)   | Query all delegations made from one delegator                 |
| [delegations-to](delegations-to.md)   | Query all delegations to one validator                 |
| [redelegations-from](redelegations-from.md)                   | Query all outgoing redelegatations from a validator                                           |
| [redelegation](redelegation.md)                               | Query a redelegation record based on delegator and a source and destination validator address |
| [redelegations](redelegations.md)                             | Query all redelegations records for one delegator                                             |
| [pool](pool.md)                                               | Query the current staking pool values                                                         |
| [params](params.md)                                   | Query the current staking parameters information                                              |
| [partner-delegation](partner-delegation.md)                   | Query a delegation based on address and partner validator address                                           |
| [partner-delegations](partner-delegations.md)                               | Query all partner delegations made by one delegator |
| [partner-validator](partner-validator.md)                               | Query a partner validator |
| [partner-validators](partner-validators.md)                             | Query for all partner validators                                            |
| [partner-delegations-to](partner-delegations-to.md)                                               | Query all delegations made to one partner validator                                                        |