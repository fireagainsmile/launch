# lambdacli query market params

## Description

Query the chain default market params

## Usage
```
lambdacli query market params [flags]
```

Print help messages:
```
lambdacli query market params -h
```

## Examples

Query the chain default market params
```
lambdacli query market params
```

```
Params:
  market_min_rate:              0.000000000000000000
  market_max_rate:              1.000000000000000000
  market_min_price:             5000000
  order_normal_price:           5000000
  order_normal_rate:            1.000000000000000000
  order_premium_rate:	        0.500000000000000000
  order_cancel_time_duration:   1h0m0s
  order_min_buy_size:           1
  order_min_buy_duration:       720h0m0s
  order_max_buy_duration:       43200h0m0s
  order_with_draw_min_duration: 24h0m0s
  miner_with_draw_duration:     1h0m0s
  price_unit_set:               [ulamb]
  size_unit_set:                [GB]
  duration_unit_set:            [month]
  sell_order_buy_self:          true
```
