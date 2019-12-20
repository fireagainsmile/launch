

1个miner对应多个storagenode   
测试网矿工和存储节点接入教程操作演示：[https://pan.baidu.com/s/1j-defxC0y2gT_vKupwGcVA](https://pan.baidu.com/s/1j-defxC0y2gT_vKupwGcVA)

* [配置miner：](#配置miner节点)
* [1. 下载安装包并解压](#1下载安装包并解压)
* [2. 配置miner](#2配置miner)
* [3. 添加矿工账户](#3添加矿工账户)
* [4. 创建miner](#4创建miner)
* [5. 初始化storagenode](#5初始化storagenode)
* [6. storagenode配置和启动](#6storagenode配置和启动)
* [7. 矿工创建卖单](#6矿工创建卖单)
* [8. 创建买单](#7创建买单)
---
* [挖矿及文件上传查看：](#挖矿及文件上传查看)
* [1. 挖矿配置](#1配置)
* [2. 上传文件](#2上传文件)
* [3. 矿工挖矿](#3矿工挖矿)
* [4. 挖矿收益](#4挖矿收益)
---
* [提取订单收益](#提取订单收益)
* [测试网络连通](#测试网络联通)
* [1. 测试dht连通](#1测试dht连通)
* [2. 测试miner服务](#2测试miner服务)
* [3. 测试storagenode服务](#3测试storagenode服务)
* [4. 测试validatornode服务](#4测试validatornode服务)


# 存储业务架构图
![avatar](arch_img/lamborage_arch.jpg)

# 配置miner节点

## 1下载安装包并解压

创建目录并进入 

```
mkdir -p ~/LambdaIM && cd ~/LambdaIM
```
下载安装包
```
wget https://github.com/LambdaIM/launch/releases/download/v0.2.0/lambda-storage-0.2.0-testnet.tar.gz
```
解压安装包
```
tar zxvf lambda-storage-0.2.0-testnet.tar.gz
```
进入解压后的目录
```
cd lambda-storage-0.2.0-testnet
```

## 2配置miner

```
./lambdacli config node tcp://182.92.66.63:26657

可选节点IP如下:
182.92.66.63
47.93.196.236
47.94.129.97
39.105.148.217
```

```
 ./lambdacli config chain-id lambda-chain-test4.3
```

```
./lambdacli config trust-node true
```
## 3添加矿工账户
将[your-account-name]替换成您自定义的账户名称，需要设置您的账户密码，不用加中括号

### 添加矿工账户及矿工子账户
```
./lambdacli keys add [your-account-name] --generate-miner 
```


如果是钱包创建的账户导入，则通过钱包创建账户时候的助记词进行操作

```
./lambdacli keys add [your-account-name] --recover --generate-miner 
```
输入命令后按照提示输入密码和助记词即可

### 查看矿工子账户地址
```
cat [your-account-name]_miner_key.json
返回如下结果：
{"privateKey":"730a6c61bd956017142f8d4deac747cf78ea7eddf69cd0de2ade5bec522ee4e5","publicKey":"02f91239071b0355abfee795809ee8dd8e2b314aa58fe310e58d6f78e7dbb28e8c","masterAddress":"lambda1npfque9u42nqkn443t8r6zmzan55kj4sfnh26c","address":"lambda1g0lhxnq65uy6mnuf5jauc5tym9sgr97gvcrjud"}

其中masterAddress是矿工账户地址
其中address是矿工子账户地址
```

### 仅生成矿工子账户
```
./lambdacli keys create-miner [your-account-name] 
```

## 4创建miner
质押到节点。
节点地址 可通过浏览器查找 http://testbrowser.lambda.im/#/ 或询问节点，
[your-account-name] 是您在第3步创建的账户名称
### 质押资产到节点
```
./lambdacli tx staking delegate lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl 20000000utbb \
--from [your-account-name] --broadcast-mode block -y
可选节点地址：
lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl
lambdavaloper1thj5fv8d0dsh3aealhpxm9mvgxjfh87suwuj2h
lambdavaloper1a83p8s9gs5hua09xn5ktmahepst3vzg9u2l20d
```

### 初始化矿工及配置
```
./minernode init
```
会生成矿工配置文件~/.lambda_miner/config/config.toml，参考如下说明进行配置
```
# 服务需要监听的地址
# 以本机内网IP为 192.168.10.10，端口映射的外网IP为 200.200.200.100 为例
[server]
# 对外提供服务的地址，推荐配置为内网地址做端口映射到外网IP
address = "192.168.10.10:13000"
# 对内提供服务的地址，主要是给StorageNode使用，推荐配置为内网地址
private_address = "192.168.10.10:13001"
debug_log_traffic = "false"

[kad]
# DHT接入节点地址，存储网络提供，以 47.94.129.97:12000 为例
bootstrap_addr = ["47.94.129.97:12000"]
# time you would wait to connect dht seed node
bootstrap_backoff_max = "30s"
bootstrap_backoff_base = "1s"
db_path = "/Users/gavin/.lambda_miner/kademlia"
# this should listen at Public IP
## 对外暴露的提供服务的地址
external_address = "200.200.200.100:13000"
alpha = 3

[kad.routing_table_config]
bucket_size = 20
replacement_cache_size = 5

[log]
level = "info"
output_file = "stdout"

[db]
# db config
lru_cache = "131072"
keep_log_file_num = "1000"
write_buffer_size = "134217728"
recycle_log_file_num = "0"
target_file_size_base = "268435456"
max_write_buffer_number = "4"
max_bytes_for_level_base = "4294967296"
level_0_stop_writes_trigger = "24"
target_file_size_multiplier = "1"
max_background_compactions = "2"
max_bytes_for_level_multiplier = "2"
level_0_slowdown_writes_trigger = "17"
level_0_file_num_compaction_trigger = "8"
level_compaction_dynamic_level_bytes = "0"
compaction_algorithm = "0"

[api_key]
# 颁发的apikey的配置，不能为空
key_name = "key"
location = "localhost"
# 目前只用关心这个字段就行
root_seed = "yah"
```

### 创建矿工
[miner-name] 是您在第3步创建的账户名称, 矿工配置这里使用[miner-name]代称。  
[miningAddr] 使用第3步查看的矿工子账户地址。
[dht-id] 使用`./minernode info`查询
```
./lambdacli tx market create-miner --dht-id [dht-id] --mining-address [miningAddr] --from [miner-name] --broadcast-mode block -y
```
### 启动矿工服务
[path/to/subminer.json] 为第三步添加矿工及子账户中生成的json文件完整路径，如/home/test/test_miner_key.json
[log_file_path] 指定矿工日志完整路径
```
./minernode run --query-interval 5 --daemonize --key-file [path/to/subminer.json] --log.file [log_file_path]
```


### 查看矿工服务进程
```
./minernode --status
```
```
返回结果如下即进程在运行中：
2019/11/27 08:37:39 miner server is running as daemon, pid is 19678
```

### 停止矿工服务
```
./minernode --stop
```
```
返回结果如下即停止矿工服务成功：
2019/11/27 08:38:51 miner server stoped
2019/11/27 08:38:51 miner server pid file /root/.lambdacli/daemon/miner_server.pid removed
```

## 5初始化storagenode

```
./storagenode init
```
生成存储节点配置文件~/.lambda_storage/config/config.toml，参考如下第6步进行配置

## 6storagenode配置和启动
[storagenode配置启动参考](./%E6%B5%8B%E8%AF%95%E7%BD%910.4.0Storagenode%E6%8E%A5%E5%85%A5%E6%95%99%E7%A8%8B.md)

## 7矿工创建卖单

加上--normal参数（赔付比率rate为0.5）的是普通卖单，价格只能等于5000000ulamb；
不加--normal参数（赔付比率等于1）的为优质卖单，优质卖单可指定大于等于5000000ulamb的任意价格。  
设置指定storagenode的machine-name需要卖出的空间大小size；   
最小购买空间min-size不能小于1GB;  
最小购买时长min-buy-duration不能小于1month;  
最大购买时长max-buy-duration不能大于60month。

注意：测试网中尽量挂优质卖单（不加--normal参数），这样创建买单时才能指定卖单ID匹配到自己矿工的卖单。

### 创建普通卖单

一个矿工可创建多笔卖单，卖单总空间不能大于质押TBB数量，例如：一个矿工质押了1000000utbb（即1TBB），创建卖单总空间不能超过1TB（即1000GB）

```
./lambdacli tx market create-sellorder --price 5000000ulamb  \
--normal \
--size [size]GB \
--market-name LambdaMarket \
--min-size [min-size]GB \
--min-buy-duration [min-buy-duration]month \
--max-buy-duration [max-buy-duration]month \
--from [miner-name] --broadcast-mode block -y
```

### 创建优质卖单

```
./lambdacli tx market create-sellorder --price [sellorder-price]  \
--size [size]GB \
--market-name LambdaMarket \
--min-size [min-size]GB \
--min-buy-duration [min-buy-duration]month \
--max-buy-duration [max-buy-duration]month \
--from [miner-name] --broadcast-mode block -y
```
### 查询卖单


```
查询账户地址：
./lambdacli keys show [miner-name] --address
根据账户地址查看矿工卖单：
./lambdacli query market miner-sellorders [address] [page] [limit] 

例如：
查看账户名为miner2的地址：./lambdacli keys show miner2 --address
返回结果：lambda1k6rxrmly7hz0ewh7gth2dj48mv3xs9yz8ffauw

./lambdacli query market miner-sellorders lambda1k6rxrmly7hz0ewh7gth2dj48mv3xs9yz8ffauw 1 10
返回结果：
SellOrder
  OrderId:            54F82FBD979BE150C8B3246D82DDF60F043129EE  //卖单ID，取消卖单或创建优质买单时需要用到此ID
  Address:            lambdamineroper1k6rxrmly7hz0ewh7gth2dj48mv3xs9yznx96fn
  Price:              5000000
  Rate:               3.000000000000000000  //rate大于等于3，则该卖单为优质卖单
  Amount:
  SellSize:           400
  UnUseSize:          0
  Status:             1
  CreateTime:         2019-11-04 12:02:24.379880755 +0000 UTC
  CancelTimeDuration: 1h0m0s
  MarketAddress:      lambdamarketoper1thj5fv8d0dsh3aealhpxm9mvgxjfh87srk3887
  MachineName:        machine1
  MinBuySize:         1
  MinDuration:        720h0m0s
  MaxDuration:        43200h0m0s
```

### 取消卖单

根据SellOrderID取消卖单
```
./lambdacli tx market cancel-order [orderId] --from [miner-name] --broadcast-mode block -y
```


## 8创建买单
矿工不能买自己的卖单，只能换其他账户来挂买单。

创建优质买单需要指定对应优质卖单SellOrderID。

account-name为当前账户的名称；
duration为购买时长；
size为需要购买的空间，不小于对应卖单指定的最小购买空间。

### 创建普通买单

```
 ./lambdacli tx market create-buyorder --from [account-name] \
 --duration [buy-duration]month --market-name LambdaMarket \
 --size [size]GB --broadcast-mode block -y
```

### 创建优质买单
[orderId] 可指定1个或多个优质卖单ID，指定多个卖单ID时以逗号分隔，例如：58941CFFEEA859AED51172F0F9DF3E77293D2E12,54F82FBD979BE150C8B3246D82DDF60F043129EE
```
./lambdacli tx market create-buyorder --sellorder-id [orderId] \
--from [your-account-name] --duration [buy-duration]month \
--market-name LambdaMarket --size [size]GB --broadcast-mode block -y
```
### 查询匹配订单

```
查询账户地址：
./lambdacli keys show [account-name] --address
根据账户地址查看匹配订单：
./lambdacli query market matchorders [address] [page] [limit]

例如：
./lambdacli keys show buyaccount --address
返回结果：lambda1thj5fv8d0dsh3aealhpxm9mvgxjfh87s224esr
./lambdacli query market matchorders lambda1thj5fv8d0dsh3aealhpxm9mvgxjfh87s224esr 1 10
返回结果：
MatchOrder
  OrderId:               05F09566BA4397BC9EB378EC202676D3FFCAF660   //匹配订单ID，上传文件时需要用到该ID
  AskAddress:            lambdamineroper1k6rxrmly7hz0ewh7gth2dj48mv3xs9yznx96fn
  BuyAddress:            lambda1thj5fv8d0dsh3aealhpxm9mvgxjfh87s224esr
  SellOrderId:           58941CFFEEA859AED51172F0F9DF3E77293D2E12
  BuyOrderId:            F3B5BDE351253E1D47DA7CEB24C0E4BAB5BDA808
  Price:                 5000000
  Size:                  20
  CreateTime:            2019-11-01 13:20:58.296399278 +0000 UTC
  EndTime:               2019-12-01 13:20:58.296399278 +0000 UTC
  CancelTimeDuration:    1h0m0s
  WithDrawTime:          2019-11-01 13:20:58.296399278 +0000 UTC
  Status:                0
  MarketAddress:         lambdamarketoper1thj5fv8d0dsh3aealhpxm9mvgxjfh87srk3887
  MachineName:           machine1
  UserPay:               100000000ulamb
  MinerPay:              100000000ulamb
  PubKey:                PubKeyEd25519{5AD2B4ECA8C33922A8228A5217900E5725BF3013639118D1002B6A413971F9DC}
  PeerId:                bdd4da2a3021d30e8f215dba64716cec02cdb8a7
  DhtId:                 5i6fXKQJoktPVmt9PAfZ18RN7DG6tghQN7SK7A3Bq4Rc
```


# 挖矿及文件上传查看

## 1配置

初始化storagecli
```
./storagecli init
```
初始化storagecli 后会默认生成配置文件~/.lambda_storagecli/config/user.toml，修改user.toml

```
[broker]
# dht_gateway_addr为验证节点的dht服务 IP和端口；
dht_gateway_addr = "39.105.148.217:13000"  ## 可选dht地址：39.105.148.217:13000/47.94.129.97:13000/47.93.196.236:13000
# validator_addr为验证节点IP和端口
validator_addr = "39.105.148.217:13659"   ## 可选地址：39.105.148.217:13659/47.94.129.97:13659/47.93.196.236:13659
extra_key_file = " "

[gateway]
# local listen address
address = "0.0.0.0:9002"
# for login web UI
access_key = "accesskey"
secret_key = "secretkey"
```
同步所有订单的token

account-name 为发起买单账户名称
```
./storagecli token sync [account-name]
```


## 2上传文件

文本/图片/视频/音频/可执行文件/压缩包文件可正常上传。上传源文件路径为绝对路径。

- orderId为匹配单orderID;
- account-name为发起买单账户名称；

- 用内网上传文件使用下面两个参数：
- - provider_storage_address为配置文件~/.lamborage/config/node.toml里的gateway.address，下面示例中9000端口自行修改为配置里的端口
- - provider_node_address为配置文件~/.lamborage/config/node.toml里的server.address，下面示例中13000端口自行修改为配置里的端口


### 上传文件
[bucket-name] 可设置为任意字符串
```
LAMBDA_ORDER_ID=[orderId] ./storagecli cp [account-name] [srcPath] lamb://[bucket-name]/ 

匹配订单ID为内网存储节点：
LAMBDA_ORDER_ID=[orderId] ./storagecli cp [account-name] [srcPath] lamb:// --provider_node_address [存储节点内网IP]:13000 --provider_storage_address [存储节点内网IP]:9000
```


### 查看上传文件列表

```
LAMBDA_ORDER_ID=[orderId] ./storagecli ls [account-name] lamb:// 
```

## 3矿工挖矿

矿工每存储文件1G文件会对应生成一个声明，所有声明有效期为1个月，每个出块周期（大约每6s出一个块）会由共识网络发起挑战，挑战声明成功并提交挖矿证明的矿工就会得到一笔收益。


1. 有效订单且有效存储文件 >= (1T) 的矿工有挖矿权利；
2. 矿工已存文件分别为1/3/5G可生成对应1/3/5个声明；
3. 单个矿工声明越多，该矿工被挑选到的概率越大。


## 4挖矿收益
矿工收益 = 单个区块增发量 * （43% * 95% / 挖矿的矿工数量） + 单个区块增发量 * （43% * 5% / 挖矿的矿工数量 ）* 矿工质押量在节点质押量的占比 * 75%

```
比如单个区块增发量为100LAMB，全网共1个节点该节点质押666TBB，全网共10个矿工分别质押1TBB且分别有10个声明。
则单个矿工单个区块得到的挖矿奖励为4.085LAMB= 100LAMB * 43% * 95% / 10 + 100LAMB * 43% * 5% / 10 * 1/676 * 75%
```

# 提取订单收益
[按匹配订单提取卖单收益](./docs/lambdacli/tx/market/withdraw-miner.md)  
[按存储节点提取卖单收益](./docs/lambdacli/tx/market/miner-withdraw-machine.md)

## 测试网络连通

当启动dht、miner、storage node、validator上传文件时有报错，请开启debug进行排查。
### 1测试dht连通

```
./storagecli debug dht --address [dht.external_address]
```
### 2测试miner服务

```
./storagecli debug miner --address [miner server address]

```
### 3测试storagenode服务
注意：
使用storagecli debug order命令测试上传文件，则gateway需要kill掉 再用最新安装包启动时加上--debug参数：
`nohup ./storagenode gateway --debug >> sgateway.log 2>&1 &`

```
./storagecli debug order --provider_node_address [dht.external_address] --provider_storage_address [gateway.external_address]
```
### 4测试validatornode服务

```
./storagecli debug validator --address [validator address]
```
