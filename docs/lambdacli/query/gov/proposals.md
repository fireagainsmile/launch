# lambdacli query proposals

## Description

Query proposals with optional filters

## Usage

```
lambdacli query gov proposals [flags]
```

Print help messages:
```
lambdacli query gov proposals -h
```

## Examples

```
lambdacli query gov proposals --depositor lambda1skjwj5whet0lpe65qaq4rpq03hjxlwd9nf39lk
lambdacli query gov proposals --voter lambda1skjwj5whet0lpe65qaq4rpq03hjxlwd9nf39lk
lambdacli query gov proposals --status (DepositPeriod|VotingPeriod|Passed|Rejected)
```

output:

```txt
ID - (Status) [Type] Title
1 - (Rejected) [Text] Burn coins proposal
```
