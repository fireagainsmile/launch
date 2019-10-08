# lambdacli tx vote government proposal 

## Introduction

Submit a vote for an active proposal

## Usage

```
lambdacli tx gov vote [proposal-id] [option] --from peter

options: yes/no/no_with_veto/abstain
```

Print help messages:
```
lambdacli tx gov vote --help
```

## Unique Flags

| Name, shorthand     | type   | Required | Default  | Description                                                         |
| --------------------| -----  | -------- | -------- | ------------------------------------------------------------------- |
| --from | string | true     | ""       |  Name or address of private key with which to sign |

## Examples

```
lambdacli tx gov  vote 1 yes --from peter
```

Output:
```
Response:
  Height: 8564
  TxHash: 8420D1E0B40749E68DF207CFB21E45372F465C1F0D4F38871BED6405321CFF24
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 16098
  Tags:
    - action = vote
    - sender = lambda1mn7dvaa45mzfefq52antavyvfjluvsgl3v3pyw
    - proposal_id = 1
```
