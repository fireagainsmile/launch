# lambdacli query proposal's result

## Description

Get the tally of a proposal vote

## Usage

```
lambdacli query gov tally [proposal-id] [flags]
```

Print help messages:
```
lambdacli query gov tally -h
```

## Examples

```
lambdacli query gov tally 1
```

output:

```txt
Tally Result:
  Yes:        1000000
  Abstain:    0
  No:         0
  NoWithVeto: 0
```
