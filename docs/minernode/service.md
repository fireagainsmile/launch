# minernode service

## Description

view service status

## Usage
```
 minernode service [command]
```

## Available Commands
| Name| Description |
| --------------- | --------------------- 
| list  | list all service status  |
|  show  | show service status|


## Examples

view service status


```
 ./minernode service list 
NAME                 LISTEN PORT                  STATUS
serverpub            172.17.159.132:14000         RUNNING
serverpriv           172.17.159.132:14001         RUNNING

./minernode service show serverpub 
NAME                 LISTEN PORT                  STATUS
serverpub            172.17.159.132:14000         RUNNING
```
