# interface for chain

## Description
    tendermint rpc interface for this chain

## Usage
```
./minernode info --node <host>:<port>
```

## Global flags

| Name, shorthand| type   | Required | Default Value         | Description                                                          |
| --------------- | ----   | -------- | --------------------- | -------------------------------------------------------------------- 
| --miner-home        | string    | false    | /root/.lambda_miner                    | config home directory |

## Examples

```
./minernode info --node 182.82.242.59:26657 --miner-home /root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/.lambda_miner
               version: 0.2.5-4-gd8a77f8
                dht id: 2u8PSj2PGt7TdR2ThuHMfH4k6KeEv5avgc4gbdKn3LTH
server.private_address: 172.17.159.132:14001
        server.address: 172.17.159.132:14000
  kad.external_address: 182.92.242.59:14000
    kad.bootstrap_addr: [182.92.242.59:13000]
         miner address: lambda12fldnycgpevw4gthq9w0zcfetpa9sn4d39wzlz (lambdamineroper12fldnycgpevw4gthq9w0zcfetpa9sn4d92z92l)
        mining address: lambda1kwk9qv7nncusukv7zx7j7j4mlt3eyrf6ecdwpu
      Ensure-level = 0: 1/6 of disk-space would be used for data-replicating
```