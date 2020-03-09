# 测试网Validator 0.4.6 升级教程

新节点接入参考[测试网节点0.4.6 接入教程](Testnet-Validator-Guide.md)

测试网节点从0.4.5版本升级到0.4.6版本参考如下步骤

### 1. 下载安装包并解压
`创建目录并进入`
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM  
```
如已有~/LambdaIM目录则直接进入目录：`cd ~/LambdaIM` 

`下载安装包`
```
wget https://github.com/LambdaIM/launch/releases/download/v0.4.6/lambda-0.4.6-testnet.tar.gz

如下载缓慢可使用下面的链接：
wget http://download.lambdastorage.com/lambda/0.4.6/lambda-0.4.6-testnet.tar.gz
```

`解压安装包`
```
tar zxvf lambda-0.4.6-testnet.tar.gz && cd lambda-0.4.6-testnet
```
### 2. 停止节点服务

```
./lambda stop

返回如下结果即为停止成功：
stop daemon process from lambda.pid:28638 successfully

如停止失败，可使用以下命令停止进程：
kill `ps aux | grep lambda |grep -v grep| awk '{print $2}'`
```
**注意**：  
1. 成功停止节点服务后，禁止使用v0.4.5版本的lambda程序做任何操作。  
2. 保证后续三步执行的lambda、lambdacli程序均为v0.4.6版本。  

### 3. 版本检查和自动回滚
``` 
./lambda state fix
```

### 4. 启动节点  
```
./lambda start --p2p.laddr tcp://0.0.0.0:26656 --rpc.laddr tcp://0.0.0.0:26657 --daemonize --log.file /tmp/lambda.log
```

### 5. 启动rest-server服务
rest-server服务可提供给钱包和storagecli连接
```
nohup ./lambdacli rest-server --node tcp://0.0.0.0:26657 --laddr tcp://0.0.0.0:13659 >> /tmp/lambdacli.log 2>&1 &
```
