# lambdacli query staking redelegation

## Description

Query a redelegation record  for an individual delegator between a source and destination validator

## Usage

```
lambdacli query staking redelegation <delegator-address> <src-validator-address> <dst-validator-address> [flags]
```

Print help messages:
```
lambdacli query staking redelegation -h
```

## Examples

Query a redelegation record
```
./lambdacli query staking redelegation lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67 lambdavaloper1du984e78w0jlw6zy8ejzz8hkaf4rmn2w6zr508 lambdavaloper12c3uj3pa337hc27yvym4uu66pj6yjdk93lrq0c -o json --indent
{
  "delegator_address": "lambda127tm4xwszzw8tzp7s7y9awfs4nq2e7y75g3z67",
  "validator_src_address": "lambdavaloper1du984e78w0jlw6zy8ejzz8hkaf4rmn2w6zr508",
  "validator_dst_address": "lambdavaloper12c3uj3pa337hc27yvym4uu66pj6yjdk93lrq0c",
  "entries": [
    {
      "creation_height": "58",
      "completion_time": "2020-04-17T14:03:34.746887274Z",
      "initial_balance": "1",
      "shares_dst": "1.000000000000000000"
    }
  ]
}
```

