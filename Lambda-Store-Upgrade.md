# storage0.2.3升级

* [下载安装包并解压](#下载安装包并解压)
* [清除旧版数据](#清除旧版数据)
* [minernode升级配置文件](#minernode升级配置文件)
* [storagenode升级配置文件](#storagenode升级配置文件)
* [minernode重启](#minernode重启)
* [storagenode重启](#storagenode重启)

以下为 旧版lambda-storage 升级到 lambda-storage-0.2.3-testnet 步骤



### 下载安装包并解压

创建目录并进入 

```
mkdir -p ~/LambdaIM && cd ~/LambdaIM
```
下载安装包
```
wget https://github.com/LambdaIM/launch/releases/download/v0.4.5/lambda-storage-0.2.3-testnet.tar.gz
```
解压安装包
```
tar zxvf lambda-storage-0.2.3-testnet.tar.gz
```
进入解压后的目录
```
cd lambda-storage-0.2.3-testnet
```

### 清除旧版数据
清除旧版miner数据
```
rm -rf ~/.lambda_miner/{kademlia,var}
```

清除旧版storagenode数据
```
rm -rf ~/.lambda_storage/{kademlia,orders.json,statementdb,storagedb}
rm -rf ~/.lambda_storage/{store,mining} 
```
注： 如果~/.lambda_storage/config/config.toml的data_dir和 mining_dir配置有改动，需清除掉配置的目录下的数据

清除旧版storagecli数据
```
rm -rf ~/.lambda_storagecli/localdb
```

### minernode升级

```
./minernode upgrade
```

### storagenode升级

```
./storagenode upgrade
```

### 重启minernode
[log_file_path] 指定矿工日志完整路径

1.停止minernode：
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
2.启动minernode：
```
./minernode run --query-interval 5 --daemonize --log.file [log_file_path]
```

如[your-account-name]_miner_key.json没有移动到~/.lambda_miner/config/default_miner_key.json，则加上--key-file参数启动：
```
./minernode run --query-interval 5 --daemonize --log.file [log_file_path] --key-file [filepath/your-account-name]_miner_key.json
```

### 重启storagenode
[log_file_path] 指定storagenode运行日志路径

1.停止storagenode：
```
./storagenode run --stop
```
返回结果如下即停止成功：
```
stop daemon process from storagenode.pid:22937 successfully
```
如果返回结果停止失败，使用以下命令停掉storagenode：
```
kill `ps aux | grep 'storagenode' |grep -v grep| awk '{print $2}'`
```

2.启动storagenode：
```
./storagenode run --daemonize --log.file [log_file_path]
```