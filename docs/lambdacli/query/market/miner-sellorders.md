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

### Description

|  Field    | Description  |
| --------- | ------------ | 
|  NODE     | show node status with Online or Offline   |  
|  ID       | sell order id       | 
|  MIN_BS   | Minimum purchase space       | 
|  MIN_BT   | Minimum purchase time       | 
|  MAX_BT   | Maximum purchase time       |
|  ADDR     | Miner Address       |  

result:
```
ID                                         PRICE    RATE     TOTAL    AVAIABLE STATUS   CREATE_TIME          MIN_BS   MIN_BT   MAX_BT   ADDR
10FCA01DE9B04AC231E475930EB33E387C5F139B   5LAMB    0.50     200      100      0        2020-03-18,03:46:50  1        30DAYS   1800DAYS lambdamineroper1h29mncmlezu2jsrsyvsg7vmd9zq8nt7505vwun
```
