# FAQ

### 程序版本不对
检查是否是最新版本程序
```
incompitable: Peer is on a different network. Got lambda-chain-xx, expected lambda-chain-xx.
```

### 已经Lambda程序在运行
先停止已经在运行的程序，再重新运行
```
ERROR: couldn't create db: Error initializing DB: resource temporarily unavailable.
```

### 重新升级报错
重新升级时，使用unsafe-reset-all清除历史区块数据  
重新启动仍然报以下错误，则检查data目录文件是否清除干净 
```
panic Tendermint stat.AppHash does not match AppHash after replay. Got xxxxxxxxxxxxxx, expected xxxxxxxxxx.
```

ls -l  ~/.lambda/data  
保留priv_validator_state.json，删除application.db文件.
```
drwxr-xr-x  11 xxxxxx  staff  352 Sep 15 08:57 application.db
-rw-------   1 xxxxxx  staff   48 Sep  8 23:23 priv_validator_state.json
```

### 节点被jail
当节点对块进行双签，在最近的10000个块中对少于500个块签名会被jail.

##### 重新加入共识网络
如果不满足validator的最低质押要求666,666,666utbb, 需要发起质押补足扣除的utbb  
发起unjail消息来重新加入共识网络 被jail之后的节点需要等待10分钟的惩罚来发起unjail命令  
./lambdacli tx slashing unjail --from [your-account-name]


### 查询账户不存在？

出现如下错误提示, 可能是由于您刚刚启动 lambda 还没有同步到最新块高
可以通过日志(`/tmp/lambda.log`)查看块高情况
```
[root@zh]# ./lambdacli query account lambda1z66gxs2wlhmkhh3rljtkzk96fqkk7809zb123
ERROR: {"codespace":"sdk","code":9,"message":"account lambda1z66gxs2wlhmkhh3rljtkzk96fqkkl7809zb123 does not exist"}
```

### ABCI 连接被拒绝？
出现如下错误提示，可通过`telnet`命令检查您的机器 26656 和 26657 端口是否能通
```
ERROR: ABCIQuery: Post xxx connect: connection refused
```

### 如何修改 Validator 名称
```
./lambdacli tx staking edit-validator --moniker "your-custom-name" --from [your-account-name] --broadcast-mode block -y
```
