# lambdacli query proposal

## Description

Query details of a single proposal

## Usage

```
  lambdacli query gov proposal [proposal-id] [flags]
```

Print help messages:
```
  lambdacli query gov proposal -h
```

## Examples

```
lambdacli query gov proposal 1
```

```txt
Proposal 1:
  Title:              Burn coins proposal
  Type:               Text
  Status:             Rejected
  Submit Time:        2019-10-10 03:31:35.378908 +0000 UTC
  Deposit End Time:   2019-10-10 03:31:45.378908 +0000 UTC
  Total Deposit:      1000000000000ulamb
  Voting Start Time:  2019-10-10 03:31:35.378908 +0000 UTC
  Voting End Time:    2019-10-10 03:36:35.378908 +0000 UTC
  Description:        Burn lambda100000000000000000000000000000000xh6npu's amount
```
