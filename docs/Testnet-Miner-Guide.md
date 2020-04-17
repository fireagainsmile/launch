# 矿工0.2.5接入教程

1个miner下可注册多个storagenode   
矿工和存储节点0.2.5升级参考: [Storage0.2.5升级](Lambda-Store-Upgrade.md)

## 配置矿工和存储节点

### 1下载安装包并解压
1. 创建并进入目录 
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM
```
2. 下载安装包
```
wget https://github.com/LambdaIM/launch/releases/download/Storage0.2.5/lambda-storage-0.2.5-testnet.tar.gz
```
如下载缓慢可使用下面的链接：
```
wget http://download.lambdastorage.com/lambda-storage/0.2.5/lambda-storage-0.2.5-testnet.tar.gz
```
3. 解压安装包
```
tar zxvf lambda-storage-0.2.5-testnet.tar.gz
```
4. 进入解压后的目录
```
cd lambda-storage-0.2.5-testnet
```

### 2配置lambdacli

> ```
> ./lambdacli config node tcp://[nodeip]:26657
> ```  
> * `[nodeip]` 为自己质押的验证节点`公网IP` 
>
> 可选的4个Lambda官方验证节点IP如下:  
>
> === "node1"
>     ```shell
>     ./lambdacli config node tcp://47.93.196.236:26657
>     ```
> === "node2"
>     ```shell
>     ./lambdacli config node tcp://47.94.129.97:26657
>     ```
> === "node3"
>     ```shell
>     ./lambdacli config node tcp://39.105.148.217:26657
>     ```
> === "node4"
>     ```shell
>     ./lambdacli config node tcp://182.92.66.63:26657
>     ```      

```
./lambdacli config chain-id lambda-chain-test4.8
./lambdacli config trust-node true
```

> ```
> ./lambdacli config dht-gateway-address [kad.external_address]
> ```          
>  * `[kad.external_address]` 为验证节点配置`lambda.toml`中的`kad.external_address`，可填写自己质押的验证节点`dht`地址 
> 
> 可选Lambda官方`dht-gateway-address`如下:
>
> === "dht1"
>     ```shell
>     ./lambdacli config dht-gateway-address 47.93.196.236:13000
>     ```
> === "dht2"
>     ```shell
>     ./lambdacli config dht-gateway-address 47.94.129.97:13000
>     ```
> === "dht3"
>     ```shell
>     ./lambdacli config dht-gateway-address 39.105.148.217
>     ```
> === "dht4"
>     ```shell
>     ./lambdacli config dht-gateway-address 182.92.66.63:13000
>     ```      

### 3添加矿工账户
以下`新创建矿工账户及子账户`和`已有矿工账户时，导入矿工和生成子账户`只需选一个执行  

=== "新创建矿工账户及子账户"
    ```shell
    ./lambdacli keys add [your-account-name] --generate-miner 
    ```
=== "已有矿工账户时，导入矿工和生成子账户"
    如果是钱包创建的账户导入，则通过钱包创建账户时候的助记词进行导入
    ```shell
    ./lambdacli keys add [your-account-name] --generate-miner --recover 
    ```
    输入命令后按照提示输入密码和助记词后，即导入账户和生成矿工子账户成功

* 将`[your-account-name]`替换成您自定义的矿工账户名称，需要设置您的账户密码，不用加中括号 

!!! note  
    矿工子账户用来提交挖矿声明和挖矿证明，每笔交易需要一定的手续费，需要保证矿工子账户余额大于1000LAMB

!!! tip
    也可以使用钱包进行添加矿工账户、导入/导出矿工子账户、转账、质押等操作

### 4创建miner

#### 质押资产到节点
```
./lambdacli tx staking delegate [validator-address] [amount-of-utbb] \
--from [your-account-name] --broadcast-mode block -y
```
* [validator-address] 质押的节点地址，可指定 自己的验证节点地址 或 Lambda官方节点地址，节点地址可通过浏览器查找 [http://testbrowser.lambda.im/#/](http://testbrowser.lambda.im/#/) 或询问节点  
* [amount-of-utbb] 为质押到节点的 utbb 数量，不得少于 1TBB（1TBB=1000000utbb）  
* [your-account-name] 是您在第 3 步创建的账户名称  

??? note "展开查看质押示例"
     例如质押20TBB到节点 `lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl`
    ```
    ./lambdacli tx staking delegate lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl 20000000utbb \
    --from myaccount --broadcast-mode block -y
    ```

可选Lambda官方节点地址：

=== "addr1"
    ```
    lambdavaloper1prrcl9674j4aqrgrzmys5e28lkcxmntxuvjpcl
    ```
=== "addr2"
    ```
    lambdavaloper1thj5fv8d0dsh3aealhpxm9mvgxjfh87suwuj2h
    ```
=== "addr3"
    ```
    lambdavaloper1a83p8s9gs5hua09xn5ktmahepst3vzg9u2l20d
    ```
=== "addr4"
    ```
    lambdavaloper1r340rrv9fs95gqy5087e2mtz82vvwrglt6amx3
    ```
 

#### 初始化矿工及配置
1. 初始化矿工
```
./minernode init
```
会生成矿工配置文件`~/.lambda_miner/config/config.toml`

2. 修改配置文件
 
```
vi ~/.lambda_miner/config/config.toml
```

参考配置示例手动修改配置文件 

??? note "展开查看配置示例"
    ```
    [build]
    version = "0.2.5"
    commit = "030c696bc6829cfafb3d240d66058b16b41aa460"
    mode = "release"
    
    # 服务需要监听的地址
    # 以本机内网IP为 192.168.10.10，端口映射的外网IP为 200.200.200.100 为例
    [server]
    # 对外提供服务的地址，推荐配置为内网地址做端口映射到外网IP
    address = "192.168.10.10:13000"
    # 对内提供服务的地址，主要是给StorageNode使用，推荐配置为内网地址
    private_address = "192.168.10.10:13001"
    
    [kad]
    # DHT接入节点地址，存储网络提供，可填写多个，以 47.94.129.97:13000 为例
    # 可填写自己质押的验证节点配置lambda.toml中的 kad.external_address
    # 可选官方dht地址：39.105.148.217:13000/47.94.129.97:13000/47.93.196.236:13000/182.92.66.63:13000
    bootstrap_addr = ["47.94.129.97:13000"]
    # this should listen at Public IP
    ## 对外暴露的提供服务的地址
    external_address = "200.200.200.100:13000"
    
    [log]
    level = "info"
    output_file = "stdout"
    
    [miner]
    # ensure_level=0会多占用磁盘1/6空间，ensure_level=1会多占用1/3空间
    ensure_level = "0"
    #root access key，不能为空
    root_secret_seed = "aaa"
    
    [db]
    # db config
    lru_cache = "0"
    keep_log_file_num = "16"
    write_buffer_size = "268435456"
    recycle_log_file_num = "0"
    target_file_size_base = "268435456"
    max_write_buffer_number = "25"
    max_bytes_for_level_base = "4294967296"
    level_0_stop_writes_trigger = "24"
    target_file_size_multiplier = "1"
    max_background_compactions = "2"
    max_bytes_for_level_multiplier = "2"
    level_0_slowdown_writes_trigger = "17"
    level_0_file_num_compaction_trigger = "8"
    level_compaction_dynamic_level_bytes = "0"
    compaction_algorithm = "0"
    rate_bytes_per_sec = "67108864"
    data_backup_path = ""
    ```

#### 查看矿工子账户地址
将第三步生成的`[your-account-name]_miner_key.json`文件重命名为`default_miner_key.json`并移动到`~/.lambda_miner/config/`:
```
mv [your-account-name]_miner_key.json ~/.lambda_miner/config/default_miner_key.json
```

查询矿工子账户地址：
```
./minernode show-address 
```

!!! success "返回如下结果"
    ```
    Miner Address: lambda1lhhgvyaepf92mtx5zj49fseexr3g3njlz4jmgt (lambdamineroper1lhhgvyaepf92mtx5zj49fseexr3g3njlk67uak) /*矿工账户地址*/
    Mining Address: lambda10m4xmmvwat9a53rf47pjjpn3tecdk64urd5qt9 /* 矿工子账户地址 */
    ```


#### 给子账户转账
```
./lambdacli tx send [miningAddr] 1000000000ulamb --from [your-account-name] --broadcast-mode block -y
```

* [miningAddr] 为上面查询到的矿工子账户地址（1LAMB=1000000ulamb）
* [your-account-name] 为你的账户名，需要保证该账户余额足够才能转账成功


#### 创建矿工
* [miner-name] 是您在第3步创建的矿工账户名称。  
* [miningAddr] 为矿工子账户地址。
* [dht-id] 使用`./minernode info`查询返回结果中的`dht id`
```
./minernode info
```

!!! success "返回如下结果"
    ```text hl_lines="2"
                   version: 0.2.5
                    dht id: G4xW3UHMfFnTmaRMZUJ7PKcfvr9YTTFyekcsRxKDZZD9  //创建矿工时会用到此dht-id
    server.private_address: 172.17.159.130:15001
            server.address: 0.0.0.0:26654
      kad.external_address: 39.106.153.62:26654
        kad.bootstrap_addr: [39.106.153.62:26650 172.17.159.130:26652]
          Ensure-level = 0: 1/6 of disk-space would be used for data-replicating
    ```
创建矿工命令：
```
./lambdacli tx market create-miner --dht-id [dht-id] --mining-address [miningAddr] --from [miner-name] --broadcast-mode block -y
```
#### 启动矿工服务
* [log_file_path] 指定矿工日志完整路径

```
./minernode run --query-interval 5 --daemonize --log.file [log_file_path]
```

如`[your-account-name]_miner_key.json`没有移动到`~/.lambda_miner/config/default_miner_key.json`，则加上`--key-file`参数启动：
```
./minernode run --query-interval 5 --daemonize --log.file [log_file_path] --key-file [filepath/your-account-name]_miner_key.json
```


#### 查看矿工服务进程
```
./minernode run --status
```

!!! success "返回如下结果"
    ```
    minernode.pid is running, pid is 19276
    ```

#### 停止矿工服务
```
./minernode run --stop
```

!!! success "返回如下结果"
    ```
    stop daemon process from minernode.pid:19276 successfully
    ```

### 5初始化storagenode

```
./storagenode init
```
生成存储节点配置文件`~/.lambda_storage/config/config.toml`，参考如下第6步进行配置

### 6storagenode配置和启动
[storagenode配置启动参考](./Testnet-Storagenode-Configure.md)

## 创建卖单

* 加上`--normal`参数（赔付比率`rate`为 0.5）的是普通卖单，价格只能等于`5000000ulamb`（`1LAMB=1000000ulamb`）；
不加`--normal`参数（赔付比率等于1）的为优质卖单，优质卖单可指定大于等于`5000000ulamb`的任意价格。  
* 设置需要卖出的空间大小`size`；   
* 最小购买空间`min-size`不能小于1GB;  
* 最小购买时长`min-buy-duration`不能小于`1month`;  
* 最大购买时长`max-buy-duration`不能大于`60month`。

!!! tip
    注意：测试网中尽量挂优质卖单（不加--normal参数），这样创建买单时才能指定卖单ID匹配到自己矿工的卖单。

#### 创建普通卖单

一个矿工可创建多笔卖单，卖单总空间不能大于质押TBB数量，例如：一个矿工质押了`1000000utbb`（即`1TBB`），创建卖单总空间不能超过`1TB`（即`1000GB`）

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

#### 创建优质卖单

```
./lambdacli tx market create-sellorder --price [sellorder-price]  \
--size [size]GB \
--market-name LambdaMarket \
--min-size [min-size]GB \
--min-buy-duration [min-buy-duration]month \
--max-buy-duration [max-buy-duration]month \
--from [miner-name] --broadcast-mode block -y
```
#### 查询卖单
查询账户地址：
```
./lambdacli keys show [miner-name] --address
```
根据账户地址查看矿工卖单：
```
./lambdacli query market miner-sellorders [address] [page] [limit] 
```

!!! 示例
    查看账户名为miner2的地址：
    ```
    ./lambdacli keys show miner2 --address
    ```
    返回结果：`lambda1k6rxrmly7hz0ewh7gth2dj48mv3xs9yz8ffauw`
    ```
    ./lambdacli query market miner-sellorders lambda1k6rxrmly7hz0ewh7gth2dj48mv3xs9yz8ffauw 1 10
    ```
    返回结果：
    ```shell hl_lines="2 5"
    SellOrder
      OrderId:            54F82FBD979BE150C8B3246D82DDF60F043129EE  //卖单ID，取消卖单或创建优质买单时需要用到此ID
      Address:            lambdamineroper1k6rxrmly7hz0ewh7gth2dj48mv3xs9yznx96fn
      Price:              5000000
      Rate:               1.000000000000000000  //rate等于1，则该卖单为优质卖单
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

#### 取消卖单

根据SellOrderID取消卖单
```
./lambdacli tx market cancel-order [orderId] --from [miner-name] --broadcast-mode block -y
```


## 创建买单
矿工不能买自己的卖单，只能换其他账户来挂买单。

创建优质买单需要指定对应优质卖单SellOrderID。

* `[account-name]` 为当前账户的名称；
* `[duration]` 为购买时长；
* `[size]` 为需要购买的空间，不小于对应卖单指定的最小购买空间。

#### 创建普通买单

```
 ./lambdacli tx market create-buyorder --from [account-name] \
 --duration [buy-duration]month --market-name LambdaMarket \
 --size [size]GB --broadcast-mode block -y
```

#### 创建优质买单
* `[orderId]` 可指定1个或多个优质卖单ID，指定多个卖单ID时以逗号分隔，例如：`58941CFFEEA859AED51172F0F9DF3E77293D2E12,54F82FBD979BE150C8B3246D82DDF60F043129EE`
```
./lambdacli tx market create-buyorder --sellorder-id [orderId] \
--from [your-account-name] --duration [buy-duration]month \
--market-name LambdaMarket --size [size]GB --broadcast-mode block -y
```

#### 查询匹配订单    
查询账户地址：
```
./lambdacli keys show [account-name] --address
```
根据账户地址查看匹配订单：
```
./lambdacli query market matchorders [address] [page] [limit]
```
    
!!! 示例    
    ```
    ./lambdacli keys show buyaccount --address
    ```
    返回结果：`lambda1thj5fv8d0dsh3aealhpxm9mvgxjfh87s224esr`
    ```
    ./lambdacli query market matchorders lambda1thj5fv8d0dsh3aealhpxm9mvgxjfh87s224esr 1 10
    ```
    返回结果：
    ```shell hl_lines="2 9 10"
    MatchOrder
      OrderId:               05F09566BA4397BC9EB378EC202676D3FFCAF660   //匹配订单ID，上传文件时需要用到该ID
      AskAddress:            lambdamineroper1k6rxrmly7hz0ewh7gth2dj48mv3xs9yznx96fn
      BuyAddress:            lambda1thj5fv8d0dsh3aealhpxm9mvgxjfh87s224esr
      SellOrderId:           58941CFFEEA859AED51172F0F9DF3E77293D2E12
      BuyOrderId:            F3B5BDE351253E1D47DA7CEB24C0E4BAB5BDA808
      Price:                 5000000
      Size:                  20
      CreateTime:            2019-11-01 13:20:58.296399278 +0000 UTC //匹配订单开始时间
      EndTime:               2019-12-01 13:20:58.296399278 +0000 UTC //匹配订单结束时间
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

## 匹配订单续期
`链0.4.8 - 存储0.2.5`版本 新增匹配订单续期功能。   
1. 匹配订单未到期的，购买了空间的账户可使用`lambdacli tx market order-renewal`命令续期。  
2. 匹配订单已过期的，不能再进行续期；  
3. 同一匹配订单可多次续期；  
4. 续期后的匹配订单总时长（即结束时间减开始时间），不能超过60个月（1个月=30天）。

续期成功后，可进入浏览器[http://testbrowser.lambda.im/#/](http://testbrowser.lambda.im/#/)搜索匹配订单ID，查看`匹配订单详情页`中结束时间是否延期了对应时长。  
或使用上面查询匹配订单命令`lambdacli query market matchorders`查看返回结果中的匹配订单结束时间（即`EndTime`）是否延期了对应时长。

* `[orderId]` 需要进行续期的匹配订单ID;  
* `[duration]` 订单续期时长，单位为月。如设为3month，为续期3个月。

```
./lambdacli tx market order-renewal [orderId] [duration] --from [account]
```

!!! 示例
    ```
    账户buyaccount给自己购买的匹配订单0D3FAE471BFC92CED2AB7806E6AC648973357CAF 续期2个月
    ./lambdacli tx market order-renewal 0D3FAE471BFC92CED2AB7806E6AC648973357CAF 2month --from buyaccount --broadcast-mode block -y
    Response:
      Height: 63
      TxHash: 144EE614E02E1F4C347BEC08785A74E7F01411BEB6735FC668D25C23E078FEFD
      Raw Log: [{"msg_index":"0","success":true,"log":""}]
      Logs: [{"msg_index":0,"success":true,"log":""}]
      GasWanted: 200000
      GasUsed: 42848
      Tags:
        - action = orderRenewal
        - address = lambda1jlh7644ghjjt72quxhraxt7aegj79pdr7unczs
     
    ```
订单续期后，重新`storagecli token sync`后存储获取订单最新日期，通过`storagecli order list` 可查看订单到期时间

!!! 示例
    ```
    执行storagecli token sync获取订单最新日期
    
    ./storagecli token sync buy
    Password to sign with 'buy':
    sync orders begin, This may take some time...
    http://182.92.242.59:13659/market/user/matchorders/lambda1ejuhsxthm7kpjz63eczlg28prrfje9vd22ma3x
    Order                                              Total                Used
    19FF9732F7E9069C689216173D3842612EDF02CC           6.0 GiB              101 MiB
    293B8613B1E26A79F6554472645FACB809F4BAE8           30 GiB               7.9 GiB
    29E301D07BDF6D22CE5813760F8F857326842C20           7.0 GiB              200 MiB
    5A8E65C1C04177234DC8E7B7DFBCE98CC31134AC           1.0 GiB              677 MiB
    EC349DC8803BEE33B21E487A2481EB94CFC1F8DD           5.0 GiB              627 MiB
    sync orders finish
    
    
    storagecli order list 可查看订单到期时间
    ./storagecli order list buy
    Password to sign with 'buy':
    
    OrderId                                  |Expire                  |Used/Total      |ProviderStatus
    19FF9732F7E9069C689216173D3842612EDF02CC |2020-09-10 17:36:26 CST |100 MiB/6.0 GiB |Avaialable
    293B8613B1E26A79F6554472645FACB809F4BAE8 |2020-09-24 18:23:49 CST |7.9 GiB/30 GiB  |Avaialable
    29E301D07BDF6D22CE5813760F8F857326842C20 |2020-07-12 17:37:06 CST |200 MiB/7.0 GiB |Avaialable
    5A8E65C1C04177234DC8E7B7DFBCE98CC31134AC |2020-09-29 09:48:16 CST |50 MiB/1.0 GiB  |Avaialable
    EC349DC8803BEE33B21E487A2481EB94CFC1F8DD |2020-08-11 17:35:00 CST |150 MiB/5.0 GiB |Avaialable
    Total: 5
    Current time: 2020-04-14 17:58:49 CST
    
    ```

## 文件上传和查看

### 1配置

初始化storagecli
```
./storagecli init
```
初始化`storagecli` 后会默认生成配置文件`~/.lambda_storagecli/config/user.toml`

参考如下说明手动修改配置文件  
```
vi ~/.lambda_storagecli/config/user.toml
```

??? note "展开查看配置示例"
    ```
    [broker]
    # dht_gateway_addr为验证节点的dht服务 IP和端口；
    # 可以是自己质押的验证节点配置的kad.external_address，这里以 47.94.129.97:13000 为例
    # 可选官方dht地址：39.105.148.217:13000/47.94.129.97:13000/47.93.196.236:13000/182.92.66.63:13000
    dht_gateway_addr = "39.105.148.217:13000" 
    # validator_addr为验证节点IP和端口，可以是自己质押的验证节点rest-server服务指定的laddr地址
    # 可选官方地址：39.105.148.217:13659/47.94.129.97:13659/47.93.196.236:13659
    validator_addr = "39.105.148.217:13659"   
    
    [gateway]
    # local listen address
    address = "0.0.0.0:9002"
    # for login web UI
    access_key = "accesskey"
    secret_key = "secretkey"
    ```
同步所有订单的token

* `[account-name]` 为发起买单账户名称
```
./storagecli token sync [account-name]
```


### 2上传文件

文本/图片/视频/音频/可执行文件/压缩包文件可正常上传。上传源文件路径为绝对路径。

* `[orderId]` 为匹配单orderID;
* `[account-name]` 为发起买单账户名称；
* `[bucket-name]` 可设置为长度不小于3且不大于64位的英文大小写，一个订单下可以有多个`bucket`

#### 上传文件

```
创建bucket：
LAMBDA_ORDER_ID=[orderId] ./storagecli mb [account-name] lamb://[bucket-name]/

上传文件：
LAMBDA_ORDER_ID=[orderId] ./storagecli cp [account-name] [srcPath] lamb://[bucket-name]/ 

```


#### 查看上传文件列表

```
LAMBDA_ORDER_ID=[orderId] ./storagecli ls lamb://[bucket-name]/ 
```

### 3查看订单和矿工状态
```
./storagecli order list [account-name]
```

!!! 示例
    ``` 
    ./storagecli order list myaccount 
    
    OrderId                                  |Expire           |Used/Total      |ProviderStatus
    81B7663F9D5F40A37F4875FC1B95E2C5E1CD7FEA |2020-04-24 09:00 |100 GiB/100 GiB |Maintaining
    EF667304E33C6AAB9D56F04DF878FD93A5153B6D |2020-04-24 09:00 |100 GiB/100 GiB |Invalid
    Total: 2
    
    ProviderStatus为矿工状态，Avaialable为正常状态，Maintaining矿工正在维护，Invalid 矿工失效
    ```



## 文件分享

一个账户可以通过分享命令给另一个存储账户进行分享文件。接收者可以在分享者分享的期限内下载文件.

### 分享文件
 
* `[remote path]`：分享文件的文件地址，可以分享整个文件夹，不加具体文件即可
 
* `[duration]`：分享文件的期限，Y:年 M:月 d:天 h:小时 m:分 s:秒.（`8M7h6m`, 代表: 8个月 + 7小时 + 6分）
 
用法： 
```
storagecli token share ACCOUNT [remote path] [duration] --download  [flags]
```
!!! 示例
    ```
    LAMBDA_ORDER_ID=5A8E65C1C04177234DC8E7B7DFBCE98CC31134AC ./storagecli token share buy lamb://test/file50_e477d42cadc445049507f215142be187  1M2h3m4s  --download
    Password to sign with 'buy':
    create share token with these properties:
    share duration: 722h3m4s
    share path: lamb://test/file50_e477d42cadc445049507f215142be187
    share type: [download]
    please wait a few seconds
    got share token secret:
    2b7nqoMMBrKzEUrvz44yFWHUk3xRpBYtvy7seKpwjVdJz2iAnhBpJMiXghhkrXLqPD
    ```
执行命令后会输出`got share token secret`,接受者用来接收文件。

### 接收分享文件

`ACCOUNT`:接收账户
 
!!! tip
    `--secret`是必填的`flag`。
    
用法：
```
LAMBDA_ORDER_ID=[orderId] ./storagecli token restore ACCOUNT   [flags] 
```

!!! 示例
    ```
    LAMBDA_ORDER_ID=2E5A78E1564E7D220C327B1EC4F7087AD7CF2708  ./storagecli token restore teshare `--secret` 3gyjicaEhiNa8i8pighP6gbnVZLxAkqfBCQUgv9SAmQLu7453zgvyb48BzMcvouUUw  
    http://182.92.242.59:13659/market/user/matchorders/lambda1ejuhsxthm7kpjz63eczlg28prrfje9vd22ma3x
    file download keys nums 1
    ```

### 接收并下载分享文件

接收并下载分享文件，可以省略接收文件这一步骤。

* `ACCOUNT` :接收账户
* `[srcPath]` ：下载文件地址
* `[dstPath]`：下载后放文件地址

```
用法：
LAMBDA_ORDER_ID=[orderId] ./storagecli cp ACCOUNT [srcPath] [dstPath] [flags]
```

!!! tip
    `--secret`是必填的`flag`。
    
!!! 示例
    ```
    LAMBDA_ORDER_ID=2E5A78E1564E7D220C327B1EC4F7087AD7CF2708 ./storagecli cp  teshare lamb://test/testfiles.tar.gz_414c7b9aa8154c268220d93a8b8a131f  /root/qwe/ `--secret` 3gyjicaEhiNa8i8pighP6gbnVZLxAkqfBCQUgv9SAmQLu7453zgvyb48BzMcvouUUw  
    http://182.92.242.59:13659/market/user/matchorders/lambda1ejuhsxthm7kpjz63eczlg28prrfje9vd22ma3x
    file download keys nums 1
    duplicate token.
    found only one candicate
    downloading testfiles.tar.gz_414c7b9aa8154c268220d93a8b8a131f
    492347394 / 492347392 [---------------------------------------------------------------------------------------------------------------------------------------------------] 100.00% 12099253 p/s
    download done 410289495
    ```
### 下载分享文件
下载分享文件需要先接收分享文件，再下载分享文件。

* `ACCOUNT` :接收账户
* `[srcPath]` ：下载文件地址
用法：
```
LAMBDA_ORDER_ID=[orderId] ./storagecli cp ACCOUNT lamb://[bucket-name]/  [srcPath] [flags]
```

!!! 示例
    ```
    LAMBDA_ORDER_ID=92F1918765F3654EE1E4F98BD64B96CB4DD4C0BC  ./storagecli cp  teshare lamb://test/upload.tar.gz_3484a737e325439b80ef79cb1297d3a2  /root/qwe/ 
    found only one candicate
    downloading upload.tar.gz_3484a737e325439b80ef79cb1297d3a2
    1400395776 / 1400395752 [-------------------------------------------------------------------------------------------------------------------------------------------------] 100.00% 11287511 p/s
    download done 1166996480
    ```

## 挖矿
#### 矿工挖矿

矿工每接受文件`8GB`文件会对应生成一个声明，所有声明有效期为1个月，每个出块周期（大约每6s出一个块）会由共识网络发起挑战，挑战声明成功并提交挖矿证明的矿工就会得到一笔收益。


1. 有有效声明的矿工有挖矿权利；
2. 矿工已存文件每满8G可生成1个声明；
3. 单个矿工声明越多，该矿工被挑选到的概率越大。


#### 挖矿收益
矿工收益 = 单个区块增发量 * （43% * 95% / 挖矿的矿工数量） + 单个区块增发量 * （43% * 5% / 挖矿的矿工数量 ）* 矿工质押量在节点质押量的占比 * 75%

```
比如单个区块增发量为100LAMB，全网共1个节点该节点质押666TBB，全网共10个矿工分别质押1TBB且分别有10个声明。
则单个矿工单个区块得到的挖矿奖励为4.085LAMB= 100LAMB * 43% * 95% / 10 + 100LAMB * 43% * 5% / 10 * 1/676 * 75%
```

## 提取订单收益
[提取单个匹配订单收益](lambdacli/tx/market/withdraw-miner.md)  
[批量提取匹配订单收益](lambdacli/tx/market/miner-withdraw-count.md)

## 测试网络连通

当启动`miner`、`storagenode`、或上传文件时有报错，请使用以下命令进行排查。

### 1测试miner服务
```
./minernode info --test
```

!!! success "返回如下结果"
    ```
    
                   version: 0.2.5
                    dht id: G4xW3UHMfFnTmaRMZUJ7PKcfvr9YTTFyekcsRxKDZZD9
    server.private_address: 172.17.159.130:15001   successful
            server.address: 0.0.0.0:26654    successful
      kad.external_address: 39.106.153.62:26654    successful
        kad.bootstrap_addr: [39.106.153.62:26650 172.17.159.130:26652]    successful successful
          Ensure-level = 0: 1/6 of disk-space would be used for data-replicating
    ```
### 2测试storagenode服务
```
./storagenode info network --test
```

!!! success "返回如下结果"
    ```
                   version: 0.2.5
                    dht id: 3mta4YEgHB43RHYE83aWBouvFNNCtSc832siEwmcTUsZ
      storage.storage_name: sn1
     storage.miner_address: 172.17.159.130:15001   successful
    server.private_address: 172.17.159.130:16001   successful
            server.address: 0.0.0.0:26660    successful
      kad.external_address: 39.106.153.62:26660    successful
        kad.bootstrap_addr: [172.17.159.130:26650 172.17.159.130:26652]     successful successful 
    ```

### 查看存储节点磁盘空间
```
./storagenode info disk
```

!!! success "返回如下结果"
    ```
                   version:  0.2.5
      storage.storage_name:  sn1
          storage.data_dir:  [/lambda/data/xvdd/store /lambda/data/xvde/store /lambda/data/xvdc/中文test/store /lambda/.1lambda_storage/store]

    Disk                           |Total  |Used    |Free    |Order                                    |Reserved |Occupied
    /lambda/data/xvdd/store        |18 GiB |8.9 GiB |8.8 GiB |753E54547CC66DB840E6C717C98492640B6E5CF8 |3.0 GiB  |540 MiB
                                   |       |        |        |E15F0CCA09A8F92E401E322638CA777BC9EA24B8 |3.0 GiB  |1.9 GiB
    /lambda/data/xvde/store        |18 GiB |592 MiB |17 GiB  |D3280F0343112CC35B864CFFEE96DE3D2F39F3C7 |12 GiB   |579 MiB
    /lambda/data/xvdc/中文test/store |18 GiB |13 GiB  |4.6 GiB |DBE8C6D465D1701E71A7CBDF35E9F602A9CE55AE |6.0 GiB  |3.8 GiB
    
    Reserved为订单预留的磁盘空间，Occupied为当前订单实际占用磁盘空间
    ```

## 备份和恢复存储文件
以防配置文件丢失，请提前做好文件备份：[存储网络文件备份](StorageFile-Backup.md)


