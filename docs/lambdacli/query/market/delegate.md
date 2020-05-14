# lambdacli query market delegation

## Description

Query delegate info from market 

## Usage
```
 ./lambdacli query market delegation 
```

Print help messages:
```
lambdacli query market delegation [marketName] [address] [flags]
```

## Examples

Query delegation info from market
```
 lambdacli query market delegation lambdamarket lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7
```

After that, you will get delegation info in this market

```
MarketDelegation
  DelegatorAddress:        lambda16f32afm7zgayje7fzj477hqmcdkcwep6dwdlx7  
  MarketAddress:           lambdamarketoper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fn26xmc
  DelegateAmount:          500000000000
  InCome:                       
      feeInCome:        6333333ulamb
      commissionInCome: 
```
