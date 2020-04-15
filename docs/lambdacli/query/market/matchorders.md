# lambdacli query market matchorders

## Description

Query the matchOrders from address

## Usage
```
 lambdacli query market matchorders [address] [page] [limit] [flags]
```

Print help messages:
```
lambdacli query market matchorders -h
```

## Examples

Query the address matchorders page 1 show 10
```
lambdacli query market matchorders lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw 1 10          
```

```
MatchOrder
  OrderId:               03913D42C105842FF6186BF6A3474D0E5CD76DAB
  AskAddress:            lambdamineroper14chzwvsh5y4yt489ea3vqelq3rpf6t8335k9jf
  BuyAddress:            lambda18zjfcn4a97par2cvgjpk2dagv53um5s5z70qt8
  SellOrderId:           7D73404768D596EE7912966EB00D8B21E1E111B9
  BuyOrderId:            7EC60AAB9F82400ED482122296AED02C7ED77244
  Price:                 6000000
  Size:                  200
  CreateTime:            2020-04-13 02:30:01.43763175 +0000 UTC
  EndTime:               2025-03-18 02:30:01.43763175 +0000 UTC
  CancelTimeDuration:    1h0m0s
  WithDrawTime:          2020-04-13 02:30:01.43763175 +0000 UTC
  Status:                0
  MarketAddress:         lambdamarketoper1thj5fv8d0dsh3aealhpxm9mvgxjfh87srk3887
  UserPay:               72000000000ulamb
  MinerPay:              1200000000ulamb
  PeerId:
  DhtId:                 9kgZvrANgMVVYa3Mk5W6h1C4Ppu8fLtSsVRBPJJ3AunP```
