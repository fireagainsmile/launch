# lambdacli query market order-reward

## Description

Query the order reward

## Usage
```
 lambdacli query market order-reward [orderId] [flags]
```

Print help messages:
```
lambdacli query market order-reward -h
```

## Examples

Query match order reward
```
lambdacli query market order-reward F354CB05F5B4BC062648C24AFA667FC8241D570C         
```

```
MatchOrderWithDraw
  OrderId:        F354CB05F5B4BC062648C24AFA667FC8241D570C
  MinerPay:       250000000ulamb
  UserPay:        500000000ulamb
```
