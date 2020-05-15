# storagenode mining

## Description

Display mining related info

## Usage
```
storagenode mining [command]
```

## Available Commands

| Name| Description |                           
| --------------- | --------------------- |
| info  | Show statement info by [setupID]|
|  prune | Prune unused local statements&setups or provided [setupID]|
|  reset | Reset provided [setupID] retry count to 0|
|  status | Show all local statement status|

## Examples
```
./storagenode mining status --with-resolved
Page size: 100
Current block time: 2020-05-15 10:15:19 UTC

Pending setups

# |Setup |Retry |LastRetry


Resolving setups

# |Setup |Retry |LastRetry


Resolved setups

#    |Setup                                |Expiry                  |Expired |FinalExpiry             |X
0001 |cc249a7f-c1e1-48fb-9935-2f5d5cf23317 |2020-05-25 08:51:38 UTC |        |2020-06-14 03:27:16 UTC |0
```

```
./storagenode mining info cc249a7f-c1e1-48fb-9935-2f5d5cf23317
 next expiry: 2020-05-25 08:51:38 UTC
final expiry: 2020-06-14 03:27:16 UTC
       stage: resolved
       retry: 1
   lastRetry: 2020-05-15 08:53:30 UTC
           x: cc249a7f-c1e1-48fb-9935-2f5d5cf23317
```

``` 
./storagenode mining prune 80462807-2a92-4047-9bb3-ea14288a1822

Current block time: 2020-05-15 10:42:41 UTC
Pruned : 80462807-2a92-4047-9bb3-ea14288a1822
```
