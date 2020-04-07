# minernode init
minernode init 
## Description

init miner

## Usage
```
minernode init [flags]
```
## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| --miner.ensure_level    | int  |0 : 1/6 of disk-space would be used for data-replicating. 1 : 1/3 of disk-space would be used for data-replicating|
|  --help, -h    |   | help for init|

## Examples

init miner

```
./minernode init  --ensure-level 0
Generate config.toml /lambda/minertest1/config/config.toml
Generating key with a minimum a difficulty of 3...
Generated 1 keys; best difficulty so far: 8
Found a key with difficulty 8!
newVersionExt ... 0
Identity is located in "/lambda/minertest1/identity"
Please *take care of* CA key - it is needed for identity management!
	/lambda/minertest1/identity/ca.key
```
