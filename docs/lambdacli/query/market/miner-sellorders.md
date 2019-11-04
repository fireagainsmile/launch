# lambdacli query market miner-sellorders

## Description

Query the miner sellorders from address:

## Usage
```
 lambdacli query market miner-sellorders [address] [page] [limit] [flags]
```

Print help messages:
```
lambdacli query market miner-sellorders -h
```

## Examples

Query the miner sellorders page 1 show 10
```
lambdacli query market miner-sellorders lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw 1 10 
```

```
SellOrder
  OrderId:            B7B4C644235D9215813DB92C4FB743AA22227A48
  Address:            lambdamineroper1h29mncmlezu2jsrsyvsg7vmd9zq8nt7505vwun
  Price:              5000000
  Rate:               1.000000000000000000
  Amount:             1000000000ulamb
  SellSize:           200
  UnUseSize:          200
  Status:             0
  CreateTime:         2019-10-29 07:26:30.829215 +0000 UTC
  CancelTimeDuration: 1h0m0s
  MarketAddress:      lambdamarketoper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fn26xmc
  MachineName:        machineOne
  MinBuySize:         10
  MinDuration:        1m0s
  MaxDuration:        10m0s
```
