# storagenode init

## Description

init storage

## Usage

```
 storagenode init [flags]
```
## Global Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| --home    |/root/.lambda_storage  | config home directory|

## Examples

```
 ./storagenode init --home /root/LambdaIM/storage/storage-master-030c696-debug-03271422/.lambda_storage
Generate config :  /root/LambdaIM/storage/storage-master-030c696-debug-03271422/.lambda_storage/config/config.toml
Generating key with a minimum a difficulty of 3...
Generated 1 keys; best difficulty so far: 8
Found a key with difficulty 8!
newVersionExt ... 0
Identity is located in "/root/LambdaIM/storage/storage-master-030c696-debug-03271422/.lambda_storage/identity"
Please *take care of* CA key - it is needed for identity management!
	/root/LambdaIM/storage/storage-master-030c696-debug-03271422/.lambda_storage/identity/ca.key
```
If initialized to the default directory, you do not need to add miner-home
