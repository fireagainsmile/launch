# minernode info

## Description

show miner info

## Usage
```
minernode info [flags]
```

## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| [dht-id]     |   | show dht id    |                    | 
| [test]        |     | test if the configuration is correct    |                     |
| [key-file]     |  | private key file which associated to master miner account and to sign    |                       | 
| [node]     | tcp://localhost:26657 | \<host\>:\<port\> to tendermint rpc interface for this chain    |                       | 


## Examples

```
./minernode info  --miner-home /root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/.lambda_miner

               version: 0.2.4-debug
                dht id: 2u8PSj2PGt7TdR2ThuHMfH4k6KeEv5avgc4gbdKn3LTH
server.private_address: 172.17.159.132:14001
        server.address: 172.17.159.132:14000
  kad.external_address: 182.92.242.59:14000
    kad.bootstrap_addr: [182.92.242.59:13000]
         miner address: lambda12fldnycgpevw4gthq9w0zcfetpa9sn4d39wzlz (lambdamineroper12fldnycgpevw4gthq9w0zcfetpa9sn4d92z92l)
        mining address: lambda1kwk9qv7nncusukv7zx7j7j4mlt3eyrf6ecdwpu
      Ensure-level = 0: 1/6 of disk-space would be used for data-replicating
      
      
 ./minernode info --key-file build/test_miner_key.json 
               version: 0.2.4-debug
                dht id: 2u8PSj2PGt7TdR2ThuHMfH4k6KeEv5avgc4gbdKn3LTH
server.private_address: 172.17.159.132:14001
        server.address: 172.17.159.132:14000
  kad.external_address: 182.92.242.59:14000
    kad.bootstrap_addr: [182.92.242.59:13000]
         miner address: lambda15ld9fyhyemqfrafq7skntxr8nuqnmezyx6zwpn (lambdamineroper15ld9fyhyemqfrafq7skntxr8nuqnmezyj4wf5w)
        mining address: lambda1c7h9wjphx76hgecwk66ddlk8vwduvd6lv3d58h
      Ensure-level = 0: 1/6 of disk-space would be used for data-replicating
      
 
```
If initialized to the default directory, you do not need to add miner-home
