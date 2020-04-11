# 矿工重启

测试网升级0.4.8后，矿工需要修改配置并重启minernode服务才能保证挖矿正常。  
每块高随机挑选十个矿工进行挑战，超过5000次未响应挑战的矿工会被监禁。

### minernode重启
1.修改lambdacli配置
```
./lambdacli config chain-id lambda-chain-test4.8
```

2.停止minernode：
```
./minernode run --stop
```
返回结果如下即停止成功：
```
stop daemon process from minernode.pid:22937 successfully
```
如果返回结果停止失败，使用以下命令停掉minernode：
```
kill `ps aux | grep 'minernode' |grep -v grep| awk '{print $2}'`
```
3.启动minernode：
[log_file_path] 指定矿工日志完整路径
```
./minernode run --query-interval 5 --daemonize --log.file [log_file_path]
```

如[your-account-name]_miner_key.json没有移动到~/.lambda_miner/config/default_miner_key.json，则加上--key-file参数启动：
```
./minernode run --query-interval 5 --daemonize --log.file [log_file_path] --key-file [filepath/your-account-name]_miner_key.json
```

### 矿工维护
矿工因升级或其他理由需要暂时停止提供服务时，可执行以下矿工维护命令
``` 
./lambdacli tx market maintain --from [miner_account] --broadcast-mode block -y

例如：账户名为miner1的矿工需要维护
./lambdacli tx market maintain --from miner1 --broadcast-mode block -y
``` 

### 矿工解除维护
矿工因升级或其他理由需要暂时停止提供服务时，可执行以下解除维护命令
``` 
./lambdacli tx market unmaintain --from [miner_account] --broadcast-mode block -y
``` 

### 矿工解禁
``` 
./lambdacli tx market unjail --from [miner_account] --broadcast-mode block -y
``` 



