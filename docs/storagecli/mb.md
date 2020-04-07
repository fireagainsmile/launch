# storagecli mb

## Description

create a bucket

## Usage
```
storagecli mb ACCOUNT lamb://bucketName [flags]
```
## Flags
| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
|--debug   |  | enable debug log out |

## Examples
```
LAMBDA_ORDER_ID=F083BC34E5CC1E2E6DBD20F0A274A70252DCCBC3  ./storagecli mb testu lamb://test1
Create Bucket Success {"name":"test1","created_at":"2020-07-04T06:24:21.138796881Z","default_redundancy_scheme":{"dataShards":5,"parityShards":1}}

```
