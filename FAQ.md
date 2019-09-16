# FAQ
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
