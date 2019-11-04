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
  OrderId:               F354CB05F5B4BC062648C24AFA667FC8241D570C
  AskAddress:            lambdamineroper1h29mncmlezu2jsrsyvsg7vmd9zq8nt7505vwun
  BuyAddress:            lambda1urudd7phn2chstjz9sm6hk2q9hq6c2e4zguwju
  SellOrderId:           B7B4C644235D9215813DB92C4FB743AA22227A48
  BuyOrderId:            2D6381C83035A2FA6A58EF2968E35AB92EB63A8B
  Price:                 5000000
  Size:                  100
  CreateTime:            2019-10-29 08:27:22.797731 +0000 UTC
  EndTime:               2019-11-29 08:29:22.797731 +0000 UTC
  CancelTimeDuration:    1h0m0s
  WithDrawTime:          2019-10-29 08:27:22.797731 +0000 UTC
  Status:                0
  MarketAddress:         lambdamarketoper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fn26xmc
  MachineName:           machineOne
  UserPay:               1000000000ulamb
  MinerPay:              500000000ulamb
  PubKey:                PubKeyEd25519{23C3FA106D3A76EBBF7CFD0C97BB6D9923F733FF97E7707BE95D1371B84CC184}
  PeerId:                lambdakjinah1nczjeka
  DhtId:                 FqtQvNFpxtmUgZvGHMgUrNE5xXobEDvXBHC5Ko8cf1E7
```
