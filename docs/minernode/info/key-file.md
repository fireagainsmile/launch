
# associated master miner account 

## Description
    private key file which associated to master miner account and to sign

## Usage
```
./minernode info --key-file 
```

## Global flags

| Name, shorthand| type   | Required | Default Value         | Description                                                          |
| --------------- | ----   | -------- | --------------------- | -------------------------------------------------------------------- 
| --miner-home        | string    | false    | /root/.lambda_miner                    | config home directory |

## Examples

```
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
The private key file associated with the master miner account and to be signed with another account, and the association result is returned.If initialized to the default directory, you do not need to add miner-home
