# Miner 接入教程

### 1. 下载安装包并解压
`创建目录并进入`
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM
```
`下载安装包`
```
wget https://github.com/LambdaIM/launch/releases/download/v0.3.1/lambda-0.3.1-release.tar.gz

如下载缓慢可使用下面的链接：
wget http://download.lambdastorage.com/lambda/0.3.1/lambda-0.3.1-release.tar.gz
```

`解压安装包`
```
tar zxvf lambda-0.3.1-release.tar.gz
```

### 2. 初始化节点  
`将下面命令中的[your-moniker]替换成您自定义的节点名称，不用加中括号`  
`注意：这里的 your-moniker 必须使用英文，用于P2P网络`
```
./lambda init [your-moniker] --chain-id lambda-chain-3.0
```

### 3. 覆盖genesis.json文件
```
\cp -rf ./genesis.json ~/.lambda/config/genesis.json
```
如果初始化报错，可能是由于有老版本的测试网配置数据导致，可以通过下面的命令清除错误数据
```
rm ~/.lambda/config/config.toml ~/.lambda/config/genesis.json
./lambda unsafe-reset-all
```

### 4. 配置节点
`要确保连接的节点机器机器已开启端口26657，如果服务启动是开启了其他端口，请向节点询问`
```
./lambdacli config node tcp://[nodeip]:26657
./lambdacli config chain-id lambda-chain-3.0
./lambdacli config trust-node true
```

**注意**  
当前提供的可连接的ip地址为以下，后续在节点接入成功后会逐步退出，为保证
服务可达，请向节点询问他们的节点ip和端口

1. 39.107.247.86
2. 123.56.6.127
3. 47.94.151.210

### 5. 添加账户  
`将[your-account-name]替换成您自定义的账户名称，需要设置您的账户密码，不用加中括号`
```
./lambdacli keys add [your-account-name]
```

```如果是钱包创建的账户导入，则通过钱包创建账户时候的助记词进行操作```
```
./lambdacli keys add [your-account-name] --recover
```
输入命令后按照提示输入密码和助记词即可


### 8. 提交地址
提交上一步命令中返回的账户地址，用钱包签名并在质押系统内提交，我们会在收到后一定时间内转账

### 7. 创建 Miner
下面命令中   
`[validator-address]` 可通过浏览器查找 http://explorer.lambdastorage.com/#/validator 或询问节点  
`[your-account-name]` 是您在第5步创建的账户名称
```
./lambdacli tx staking delegate [validator-address] 1000000000utbb --from [your-account-name] --broadcast-mode block
```

