# storagecli order

## Description

provide user order operation

## Usage
```
 storagecli order [command]
```
## Available Commands

| Name| Description                                                                   |
| ---------------  | --------------------- 
| list  | Get order list under ACCOUNT|


## Examples
```
./storagecli order list mj
Password to sign with 'mj':

OrderId                                  |Expire           |Used/Total  |ProviderStatus
A60DF26061D0A98D4F9338AAC8A0683BD0927429 |2020-06-16 19:42 |0 B/30 GiB  |Avaialable
B624A15E95CC9FBE47F9BC17DB6FF8FFAEF87117 |2020-06-21 10:50 |0 B/1.0 GiB |Avaialable
D7A999F935192C313913FEF25EC9F3B2EC199819 |2020-06-18 14:38 |0 B/25 GiB  |Avaialable
Total: 3
```
