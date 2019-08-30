# lambdacli query staking redelegations

## Description

Query all redelegations records for one delegator

## Usage

```
lambdacli query staking redelegations <delegator-address> <flags>
```
Print help messages:
```
lambdacli query staking redelegations --help
```

## Examples

Query all redelegations records
```
lambdacli query staking redelegations lambda10gat77jd5ucz7gw0m3xac8jfj5l83r6cm5ufc0
```

After that, you will get all redelegations records' info for specified delegator

```
Redelegations between:
  Delegator:                 lambda10gat77jd5ucz7gw0m3xac8jfj5l83r6cm5ufc0
  Source Validator:          lambdavaloper105jf3p5qkrnq973xmc6e9f8asly79sv7hn3g70
  Destination Validator:     lambdavaloper188xynycq7hq94ftntmv99m3jltqt5tkkgtvhc8
  Entries:    Redelegation 0:
      Creation height:           347
      Min time to unbond (unix): 2019-08-26 07:20:57.437711 +0000 UTC
      Dest Shares:               1010101.010101010101010101
```
