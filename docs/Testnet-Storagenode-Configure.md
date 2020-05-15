# storagenode0.2.6 配置 
* [storagenode初始化](#storagenode初始化)
* [修改配置文件](#修改配置文件)
* [启动storagenode](#启动storagenode)


### storagenode初始化

如果存储节点已初始化，请忽略此步骤

```
./storagenode init 
```

### 修改配置文件
初始化`storagenode`后，默认生成配置文件`~/.lambda_storage/config/config.toml`

!!! abstract ""
    以下`使用旧配置文件覆盖（老用户）`和`修改配置文件（新用户）`只需选一个执行  
    === "使用旧配置文件覆盖（老用户）" 
        ```
        \cp -rf ~/lambda_bak/storagenode/config.toml ~/.lambda_storage/config/config.toml
        ```
        ```
        vi ~/.lambda_storage/config/config.toml
        ```
        将`version`改为如下版本：
        ```
        version = "0.2.6"
        ```
    === "修改配置文件（新用户）"  
        ```
        vi ~/.lambda_storage/config/config.toml
        ```
        
        ```
        [build]
        version = "0.2.6"
        commit = "030c696bc6829cfafb3d240d66058b16b41aa460"
        mode = "release"
        
        # 服务需要监听的地址
        # 以本机内网IP为 192.168.10.20，端口映射的外网IP为 200.200.200.200 为例
        [server]
        # 对外提供服务的地址，推荐配置为内网地址做端口映射到外网IP
        address = "192.168.10.20:14000"
        # 对内提供服务的地址，主要是给StorageNode使用，推荐配置为内网地址
        private_address = "192.168.10.20:14001"
        
        [kad]
        # address you want kad to connect with
        # DHT接入节点地址，可以是自己质押的验证节点或minernode配置的kad.external_address，这里以 47.94.129.97:13000 为例
        # 可选官方dht地址：39.105.148.217:13000/47.94.129.97:13000/47.93.196.236:13000/182.92.66.63:13000
        bootstrap_addr = ["47.94.129.97:13000"]
        # time you would wait to connect dht seed node
        db_path = "/root/.lambda_storage/kademlia"
        # this should listen at Public IP
        external_address = "200.200.200.200:14000"
        
        [log]
        level = "info"
        output_file = "stdout"
        
        [storage]
        ## 用于生成apikey的种子内容，不能为空
        root_secret_seed = "fasdf"
        ## 存储节点的名字，需要在矿池内部唯一，即连接同一矿工的多个storagenode的storage_name不能重复
        storage_name = "machine1"
        ## minernode对内提供服务的地址，即它的server.private_address
        miner_address = "192.168.10.10:13001"
        ## 存储路径，可填写多个以逗号隔开
        data_dir = ["/root/.lambda_storage"]
        
        ```

### 启动storagenode

启动storagenode
```
./storagenode run --daemonize --log.file [log_file_path]
```
说明：  
```
--daemonize以后台方式启动   
--log.file [log_file_path] 指定storagenode运行日志路径，不添加参数则无日志输出  
可添加--log.level debug参数，日志开启debug可查看更详细日志输出，不添加此参数则默认输出INFO级别日志 
```

### 声明重试机制
由于storagenode节点算力差异巨大，因此提供若干参数来供矿工结合自己storagenode节点的算力来调整（目标是保证2个小时内，算力稳定）

一个声明8G
每隔3分钟，检查声明重新提交
每隔10分钟，检查过期声明（测试网的 声明有效期为10天）

0.2.6版本新增以下4个可配置参数，可自行根据自己的声明数量进行调整：
* --storage.setup_expire_check_batch statement过期检查单次数量（默认值为20，每10分钟检查一次，即平均一分钟检查2个）
* --storage.setup_pending_retry_threshold 声明重新提交 重试最大次数 （默认值为40，每3分钟重试一次，若这个声明一直被选中重试提交，可以持续2个小时）
* --storage.setup_pending_retry_batch pending状态的setup重试单次数量 （默认值为9，每3分钟重试一次，即平均一分钟检查3个。注意此值要设置的比上面的setup_expire_check_batch要大一点）
* --storage.setup_resolve_batch resolving状态的setup 更新的单次数量 （默认值为9，每3分钟更新一次，平均一分钟更新3个。一般就跟--storage.setup_pending_retry_batch配置一样即可）

例如： 用户买了2400G订单，每个声明8G，假如上传文件占满全部购买空间 storagenode中会产生300个声明（=2400G/8G）。 按每分钟提交3个声明计算，300个声明至少需要100分钟才能提交完成。 


例如：矿工有3台storagenode：
sn1，提供800G空间，若要保证2小时算力稳定，则需要配置平均一个小时能检查过期400G(50个声明），平均一个小时能重试提交声明400G(50个声明），一分钟平均至少1个
sn2，提供1600G空间，需要配置平均一小时检查过期800G(100个声明），一小时重提声明800G(100个声明)，一分钟平均至少2个
sn3，提供6400G空间，需要配置平均一小时检查过期3200G(400个声明)，一小时重提声明3200G(400个声明)，一分钟平均至少7个

sn1和sn2使用默认的配置足够  
sn3 则启动需要配置参数  `--storage.setup_expire_check_batch 70 --storage.setup_pending_retry_batch 21 --storage.setup_resolve_batch 21`  
即sn3启动命令：
```
./storagenode run --daemonize --log.file [log_file_path] --storage.setup_expire_check_batch 70 --storage.setup_pending_retry_batch 21 --storage.setup_resolve_batch 21 
```

#### 查询声明状态
使用`storagenode mining status`查询当前声明数量及提交状态，加上`--with-resolved`参数查询结果包含已提交成功的声明。
``` 
./storagenode mining status --with-resolved
```
查询结果说明：
```
Page size: 100
Current block time: 2020-05-14 05:52:56 UTC

Pending setups  # storagenode新生成的还未提交的声明列表，Retry为该声明重复提交的次数

# |Setup |Retry |LastRetry


Resolving setups  # 提交到了minernode，尚未提交到链上的声明列表

# |Setup |Retry |LastRetry


Resolved setups  # 成功提交到链上了的声明列表

#    |Setup                                |Expiry                  |Expired |FinalExpiry             |X
0001 |b3aef44e-2a99-4fb7-b313-ad2b5b0f473d |2020-05-24 04:30:47 UTC |        |2020-06-13 04:12:37 UTC |0
```

### 查看storagenode进程
```
./storagenode run --status
```
```
返回结果如下即为正常运行：
storagenode.pid is running, pid is 19505
```


### 停止storagenode

```
./storagenode run --stop
```
```
返回结果如下即停止成功：
stop daemon process from storagenode.pid:19505 successfully
```

### 备份和恢复存储文件
以防配置文件丢失，请提前做好文件备份：[存储网络文件备份](StorageFile-Backup.md)



