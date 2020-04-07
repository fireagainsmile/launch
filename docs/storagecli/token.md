# storagecli token

## Description

Get token from storage provider

## Usage
```
storagecli token [command]
```

## Available Commands

| Name| Description                                                                   |
| --------------- | --------------------- 
| clear  |clear local tokens|
| list  |list local tokens|
| restore  |restore tokens from a secret|
| share  |create share tokens|
| sync  |Sync exist order's token|
| update  |Get operate token of order|


## Examples
```
 ./storagecli token  clear
clear tokens /root/.lambda_storagecli/localdb/meta

./storagecli token sync buy
Password to sign with 'buy':
sync orders begin, This may take some time...
http://182.92.242.59:13659/market/user/matchorders/lambda1sdxejrlwdjjuyjffcqxawh252kq28w8vgwlqgg
Order                                              Total                Used
A62C0765A24CB031686B06A6C1EB0F508E625F1E           15 GiB               7.8 GiB
sync orders finish

```
