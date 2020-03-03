# 测试网节点接入教程

### 1. 下载安装包并解压
`创建目录并进入`
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM
```
`下载安装包`
```
wget https://github.com/LambdaIM/launch/releases/download/v0.4.5/lambda-0.4.5-testnet.tar.gz
```

`解压安装包`
```
tar zxvf lambda-0.4.5-testnet.tar.gz && cd lambda-0.4.5-testnet
```

### 2. 初始化节点  
`将下面命令中的[your-moniker]替换成您自定义的节点名称，不用加中括号`  
`注意：这里的 your-moniker 必须使用英文，用于P2P网络`
```
./lambda init [your-moniker] --chain-id lambda-chain-test4.5
```
如果初始化报错，可能是由于有老版本的测试网配置数据导致，可以通过下面的命令清除错误数据
```
rm -rf ~/.lambda/config/config.toml ~/.lambda/config/genesis.json ~/.lambda/identity
./lambda unsafe-reset-all
```

**注意**

不要删除~/.lambda/config下的`priv_validator_key.json`和`node_key.json`文件，
如果丢失会导致节点无法再正常加入共识网络，请节点注意备份

### 3. 覆盖genesis.json文件
```
\cp -rf ./genesis.json ~/.lambda/config/genesis.json
```

### 4. 配置lambdacli
`要确保机器已开启端口26656, 26657`
```
./lambdacli config node tcp://0.0.0.0:26657
```
```
./lambdacli config chain-id lambda-chain-test4.5
```
```
./lambdacli config trust-node true
```
```
./lambdacli config dht-gateway-address 47.93.196.236:13000
可选节点IP如下:
47.93.196.236
47.94.129.97
39.105.148.217
182.92.66.63
```

### 5. 配置种子节点  
修改`~/.lambda/config/config.toml`文件，将文件中的seeds字段的值替换如下
```
vim ~/.lambda/config/config.toml
seeds = "3da3b249f4f1afd0efdd6f4676972fdc7af0ea6b@47.94.129.97:26656"
```

测试网目前可选种子节点列表：
```
e02882af5bdafa5aec086c32b8398c268d2337f1@47.93.196.236:26656
3da3b249f4f1afd0efdd6f4676972fdc7af0ea6b@47.94.129.97:26656
559f3aeb13b58e611c95fdc6b34446de81cc470d@39.105.148.217:26656
9162e0c3494d8d32acd6c5bc48d1066f2cb362e6@182.92.66.63:26656
```

**注意**

当前支持配置多个种子节点，通过`,`隔开  
切换节点后需要kill掉节点服务并且重启

### 6. 配置lambda.toml
修改`~/.lambda/config/lambda.toml`文件
```

minimum-gas-prices = ""

[log]
level = "info"
output_file = "stdout"

# 服务需要监听的地址
# 以本机内网IP为 192.168.10.30，端口映射的外网IP为 200.200.200.300 为例
[server]
# 对外提供服务的地址，推荐配置为内网地址做端口映射到外网IP
address = "192.168.10.30:12000"
private_address = "127.0.0.1:12001"
debug_log_traffic = "false"

[kad]
# DHT接入节点地址，存储网络提供，可填写多个，以 47.94.129.97:13000 为例
# 可选dht地址：39.105.148.217:13000/47.94.129.97:13000/47.93.196.236:13000/182.92.66.63:13000
bootstrap_addr = "47.94.129.97:13000"
bootstrap_backoff_max = "30s"
bootstrap_backoff_base = "1s"
db_path = "/root/.lambda/kademlia"
external_address = "200.200.200.300:12000"
alpha = 3

[kad.routing_table_config]
bucket_size = 20
replacement_cache_size = 5

[discov]
discovery_interval = "3m0s"

[db]
app_db = "/root/.lambda/data"
market_db = "/root/.lambda"
pdp_db = "/root/.lambda"
identity_files = "/root/.lambda/identity"
```

### 7. 启动节点  
```
nohup ./lambda start --p2p.laddr tcp://0.0.0.0:26656 --rpc.laddr tcp://0.0.0.0:26657 >> /tmp/lambda.log 2>&1 &
```

### 8. 添加账户  
`将[your-account-name]替换成您自定义的账户名称，需要设置您的账户密码，不用加中括号`
```
./lambdacli keys add [your-account-name]
```

```如果是钱包创建的账户导入，则通过钱包创建账户时候的助记词进行操作```
```
./lambdacli keys add [your-account-name] --recover
```
输入命令后按照提示输入密码和助记词即可


### 9. 节点领取测试网测试币
需要领取测试网TBB用以进行节点测试的，可联系Lambda官方客服

### 10. 创建Validator  
`创建Validator需要如下信息`
* pubkey -- 通过命令`./lambda tendermint show-validator` 获取
* moniker -- 这里的`moniker`名称是您的`Validator`名称，可以使用中文(与第2步的moniker可以不同),
             如果您已经创建，后面的FAQ中也有修改该名称的命令介绍
* your-account-name -- 您在第7步中设置的账户名称

`获取上述信息后，填充如下命令并执行（过程中会提示输入账号密码），即可创建Validator, 注意：所有参数不需要中括号`
```
./lambdacli tx staking create-validator \
  --amount 666666666utbb \
  --pubkey [your-cons-pubkey] \
  --moniker "[your-moniker]" \
  --from [your-account-name] --broadcast-mode block 
```

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

**注意**

当前已经成为validator的节点，在以下情况下会被惩罚，共识网络会扣除节点质押的utbb，并且把  节点移出validator集合

1. 对块进行双签
2. 在最近的10000个块中对少于500个块签名

被移出的节点需要做如下操作重新加入共识网络

1. 如果不满足validator的最低质押要求`666,666,666utbb`, 需要发起质押补足扣除的utbb，可进入浏览器——验证节点——节点详情——质押列表——查看当前节点账户地址质押代币数量 即为当前已质押代币数量
命令示例参考  
```
./lambdacli tx staking delegate [validator-address] [amount-of-utbb] --from [your-account-name]
```

2. 发起`unjail`消息来重新加入共识网络
被`jail`之后的节点需要等待10分钟的惩罚来发起`unjail`命令

```
./lambdacli tx slashing unjail --from [your-account-name]
```
