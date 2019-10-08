# lambdacli staking

## Introduction

Staking module provides a set of subcommands to send staking transactions.

## Usage

```
lambdacli tx staking <subcommand>
```

Print all supported subcommands and flags:
```
lambdacli tx staking --help
```

## Available Commands

| Name                            | Description                                                   |
| --------------------------------| --------------------------------------------------------------|
| [create-validator](create-validator.md)                       | Create new validator initialized with a self-delegation to it                                 |
| [create-partner-validator](create-partner-validator.md)                       | create new partner validator initialized with a self-delegation to it                                 |
| [edit-validator](edit-validator.md)                           | Edit existing validator account                                                           |
| [edit-partner-validator](edit-partner-validator.md)                           | edit an existing partner validator account                                                          |
| [delegate](delegate.md)                                       | Delegate liquid tokens to an validator                                                        |
| [delegate-partner](delegate-partner.md)                                       | delegate liquid tokens to a partner validator                                                        |
| [redelegate](redelegate.md)                                   | Redelegate illiquid tokens from one validator to another                                      |
| [unbond](unbond.md)                                   | Unbond illiquid tokens from a validator                                    |
| [unbond-partner](unbond-partner.md)                                   | Unbond illiquid tokens from a partner validator                                     |

