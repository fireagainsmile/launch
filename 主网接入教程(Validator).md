# Validator 接入教程

### 1. 下载安装包并解压
`创建目录并进入`
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM
```
`下载安装包`
```
wget https://github.com/LambdaIM/launch/releases/download/v0.2.3/lambda-0.2.3-release.tar.gz
```

`解压安装包`
```
tar zxvf lambda-0.2.3-release.tar.gz && cd lambda-0.2.3-release
```

### 2. 初始化节点  
`将下面命令中的[your-moniker]替换成您自定义的节点名称，不用加中括号`
```
./lambda init [your-moniker] --chain-id lambda-chain-2.3
```
如果初始化报错，可能是由于有老版本的测试网配置数据导致，可以通过下面的命令清除错误数据
```
rm ~/.lambda/config/config.toml ~/.lambda/config/genesis.json
./lambda unsafe-reset-all
```

### 3. 覆盖genesis.json文件
```
\cp -rf ./genesis.json ~/.lambda/config/genesis.json
```

### 4. 配置节点
`要确保机器已开启端口26656, 26657`
```
./lambdacli config node tcp://0.0.0.0:26657
./lambdacli config chain-id lambda-chain-2.3
./lambdacli config trust-node true
```

### 5. 配置种子节点  
`编辑~/.lambda/config/config.toml文件，将文件中的seeds字段的值替换如下`
```
vim ~/.lambda/config/config.toml
seeds = "dd3360f3a4334432af394a835662a2b21bf406e2@seednodes.oneweb.one:26656"
```

### 6. 启动节点  
```
nohup ./lambda start --p2p.laddr tcp://0.0.0.0:26656 --rpc.laddr tcp://0.0.0.0:26657 >> /tmp/lambda.log 2>&1 &
```

### 7. 添加账户  
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

### 9. 创建 Validator  
`创建Validator需要如下信息`
* pubkey -- 通过命令`./lambda tendermint show-validator` 获取
* moniker -- 您在第2步中自定义的 moniker 名字
* your-account-name -- 您在第7步中设置的账户名称

`获取上述信息后，填充如下命令并执行（过程中会提示输入账号密码），即可创建Validator, 注意：所有参数不需要中括号`
```
./lambdacli tx staking create-validator \
  --amount 666666666utbb \
  --pubkey [your-cons-pubkey] \
  --moniker "[your-moniker]" \
  --from [your-account-name] --broadcast-mode block 
```
说明：commission相关参数数值可自行指定，0.1指节点对质押者收取10%的佣金。可使用lambdacli修改节点设置。

执行完上述命令后，会返回类似如下信息，destination-validator 即 Validtor 的操作地址
```
Response:
  Height: 617
  TxHash: 9B67980CFAE286B220B912549D4288119BEDAA7B74B831FA999C3AA60089B85C
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 121675
  Tags: 
    - action = create_validator
    - destination-validator = lambdavaloper1g2wgwnrdhj29v62jh9nj8kxml48dg3sfrujk2s
    - moniker = ohoh-11
    - identity =
```

Validator 的操作地址也可通过命令获取
```
./lambdacli keys show [your-account-name] --bech val
```


