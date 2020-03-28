# 主网Validator 0.3.3 升级教程

### 1. 下载安装包并解压
`创建目录并进入`
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM  
```
如已有~/LambdaIM目录则直接进入目录：`cd ~/LambdaIM` 

`下载安装包`
```
wget https://github.com/LambdaIM/launch/releases/download/v0.3.3/lambda-0.3.3-release.tar.gz

如下载缓慢可使用下面的链接：
wget http://download.lambdastorage.com/lambda/0.3.3/lambda-0.3.3-release.tar.gz
```

`解压安装包`
```
tar zxvf lambda-0.3.3-release.tar.gz && cd lambda-0.3.3-release
```
### 2. 停止节点服务

```
kill `ps aux | grep lambda |grep -v grep| awk '{print $2}'`
```
备注：如果无法停止，请使用`ps aux|grep lambda`命令查看进程号，然后 `kill 进程号`

### 3. 启动节点  
```
nohup ./lambda start --p2p.laddr tcp://0.0.0.0:26656 --rpc.laddr tcp://0.0.0.0:26657 >> /tmp/lambda.log 2>&1 &
```



### 升级注意事项
如在 `块高2433509(北京时间2020-03-28 12:10:18)`之前 未使用0.3.3版本进行升级，节点会共识出错，需要先清除历史区块数据，然后`使用官方提供的数据压缩包启动节点` 或 `使用新版安装包从第一个块重新开始同步（耗时较长）`。  

注意：进行以下操作前 需要先停掉节点服务

#### 清除历史数据
```
./lambda unsafe-reset-all
```

#### (二选一)使用社区提供的区块链数据包启动节点
下载数据压缩包lambda_0.3.3_data.tar.gz
``` 
wget http://download.lambdastorage.com/lambda/0.3.3/lambda_0.3.3_data.tar.gz
```
解压`lambda_0.3.3_data.tar.gz`到`~/.lambda/`目录下（解压过程耗时较长，请耐心等待）
``` 
tar -zxvf lambda_0.3.3_data.tar.gz -C ~/.lambda/
```
启动节点
```
nohup ./lambda start --p2p.laddr tcp://0.0.0.0:26656 --rpc.laddr tcp://0.0.0.0:26657 >> /tmp/lambda.log 2>&1 &
```

#### (二选一)使用新版安装包重新同步
清除历史数据后，直接使用新版lambda启动节点即可
```
nohup ./lambda start --p2p.laddr tcp://0.0.0.0:26656 --rpc.laddr tcp://0.0.0.0:26657 >> /tmp/lambda.log 2>&1 &
```