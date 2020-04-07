# minernode run

## Description

Run miner service

## Usage
```
  minernode run [flags]
```
## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| --daemonize    |  |run as daemon|
|  --debug   |   | run in debug mode|
| --kad.bootstrap_addr    | strings   |F  kad bootstrap address|
|  --kad.external_address   |  strings | kad registered address(to other nodes)|
| --keepalive-interval   |int  |run as daemon|
| --key-file   |  string | private key file which associated to master miner account and to sign|
| --log.file    | string |log file path for daemon|
|  --log.level  | string  | loglevel debug\|info\|warn\|error\|fatal (default "info")|
| --miner.ensure_level    | int | 0 : 1/6 of disk-space would be used for data-replicating	1 : 1/3 of disk-space would be used for data-replicating|
|  --miner.root_secret_seed   | string  | root secret key for generate apikey|
| --node    |string  |\<host\>:\<port\> to tendermint rpc interface for this chain (default "tcp://localhost:26657")|
|  --server.address   |string| listen address (default "0.0.0.0:13000")|
| --server.private_address    | string |private listen address (default "172.17.159.132:13001")|
|  --status  |   | get daemon status|
|  --stop  |   | stop daemon|


## Examples

Run miner service

```
./minernode run --daemonize --node tcp://182.92.242.59:26657 --trust-node --log.level debug --log.file /root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/minernode.log --kad.bootstrap_addr 182.92.242.59:13000 --server.address 172.17.159.132:14000 --server.private_address 172.17.159.132:14001 --kad.external_address 182.92.242.59:14000 --miner.root_secret_seed minernoderootsecretseedramdon --debug

```

get daemon status

```
./minernode run --status 
minernode.pid is running, pid is 24584
```

stop daemon

```
./minernode run --stop
stop daemon process from minernode.pid:24584 successfully
```
