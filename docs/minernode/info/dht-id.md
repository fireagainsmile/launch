# minernode show dht-id
## Description
show dht id

## Usage
```
./minernode info --dht-id 

```
## Global flags

| Name, shorthand| type   | Required | Default Value         | Description                                                          |
| --------------- | ----   | -------- | --------------------- | -------------------------------------------------------------------- 
| --miner-home        | string    | false    | /root/.lambda_miner                    | config home directory |


## Examples
```
./minernode info --dht-id --miner-home /root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/.lambda_miner
2u8PSj2PGt7TdR2ThuHMfH4k6KeEv5avgc4gbdKn3LTH
```
DHT ID returned is used to create miners.If initialized to the default directory, you do not need to add miner-home

