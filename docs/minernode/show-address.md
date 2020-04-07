# minernode  show-address

## Description

list master address and miner address(witch contain in key file)

## Usage
```
 minernode show-address [flags]
```
## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| --key-file    |string  |private key file which associated to master miner account and to sign|
|  --help, -h    |   | help for init|
| --node    |tcp://localhost:26657  |\<host\>:\<port\> to tendermint rpc interface for this chain |


## Examples

list master address and miner address

```
 ./minernode  show-address 
  Miner Address: lambda12fldnycgpevw4gthq9w0zcfetpa9sn4d39wzlz (lambdamineroper12fldnycgpevw4gthq9w0zcfetpa9sn4d92z92l)
Mining Address: lambda1kwk9qv7nncusukv7zx7j7j4mlt3eyrf6ecdwpu

./minernode  show-address  --key-file build/test_miner_key.json
  Miner Address: lambda15ld9fyhyemqfrafq7skntxr8nuqnmezyx6zwpn (lambdamineroper15ld9fyhyemqfrafq7skntxr8nuqnmezyj4wf5w)
Mining Address: lambda1c7h9wjphx76hgecwk66ddlk8vwduvd6lv3d58h

 ./minernode  show-address  --node 39.105.67.149:26657
  Miner Address: lambda12fldnycgpevw4gthq9w0zcfetpa9sn4d39wzlz (lambdamineroper12fldnycgpevw4gthq9w0zcfetpa9sn4d92z92l)
Mining Address: lambda1kwk9qv7nncusukv7zx7j7j4mlt3eyrf6ecdwpu
```
