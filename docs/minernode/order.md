# minernode storage

## Description

manage known match orders

## Usage

```
 minernode order [command]
```
## Available Commands

| Name| Description |
| --------------- | --------------------- 
| list    | list specified(comma separated) match orders or all match orders |
| refresh |refresh all known match orders|

## Examples
```
./minernode order list

OrderId                                  |Buyer                                         |Expiry                  |Used/Total
407FF27E580D9FD7D111F03289ECD0226ED95DCB |lambda1wdp8xxtp4l56cp6a556acqwjl7tj0z44k9src2 |2020-06-14 11:27:16 CST |117 GiB/200 GiB
Total: 1
```

``` 
./minernode order refresh
Below orders have been refreshed:  1
407FF27E580D9FD7D111F03289ECD0226ED95DCB
```
