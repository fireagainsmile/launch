# lambdacli tx deposit government proposal 

## Introduction

Deposit to a proposal

## Usage

```
lambdacli tx gov deposit [proposal-id] [deposit] --from peter
```

Print help messages:
```
lambdacli tx gov deposit --help
```

## Unique Flags

| Name, shorthand     | type   | Required | Default  | Description                                                         |
| --------------------| -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
lambdacli tx gov deposit 1 10000000000ulamb --from peter
```

Output:
```
Response:
  Height: 8435
  TxHash: C5B091657E3478D83493DF4FACA2B6BBAFB5E672D6593176952B6A1E7896CC90
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 42385
  Tags:
    - action = deposit
    - sender = lambda1mn7dvaa45mzfefq52antavyvfjluvsgl3v3pyw
    - proposal_id = 2

```
