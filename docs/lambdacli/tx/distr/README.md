# lambdacli distribution 

## introduction

This document describes how to use the the command line interfaces of distribution module.

## Usage

```
lambdacli tx distr [subcommand] [flags]
```

Print all supported subcommands and flags:

```
lambdacli tx distr --help
```

## Available Subommands

| Name                            | Description                                                   |
| --------------------------------| --------------------------------------------------------------|
| [set-withdraw-addr](set-withdraw-addr.md)  | change the default withdraw address for rewards associated with an address |
| [withdraw-rewards](withdraw-rewards.md) | witdraw rewards from a given delegation address, and optionally withdraw validator commission if the delegation address given is a validator operator |
| [withdraw-all-rewards](withdraw-all-rewards.md) | withdraw all delegations rewards for a delegator |
| [withdraw-miner-rewards](withdraw-miner-rewards.md) | witdraw miner rewards |