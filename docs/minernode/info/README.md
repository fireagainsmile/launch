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
| --dht-id (dht.md)    |   | show dht id    |                    | 
| --test        |     | test if the configuration is correct    |                     |
| --help, -h      |  | help for info    |                       | 
| --key-file     | string | private key file which associated to master miner account and to sign    |                       | 
|  --node     | string | <host>:<port> to tendermint rpc interface for this chain (default "tcp://localhost:26657")    |                       | 
