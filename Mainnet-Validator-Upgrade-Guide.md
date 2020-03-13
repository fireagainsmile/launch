# 主网Validator 0.3.2 升级教程

### 1. 下载安装包并解压
`创建目录并进入`
```
mkdir -p ~/LambdaIM && cd ~/LambdaIM  
```
如已有~/LambdaIM目录则直接进入目录：`cd ~/LambdaIM` 

`下载安装包`
```
wget https://github.com/LambdaIM/launch/releases/download/v0.3.2/lambda-0.3.2-release.tar.gz

如下载缓慢可使用下面的链接：
wget http://download.lambdastorage.com/lambda/0.3.2/lambda-0.3.2-release.tar.gz
```

`解压安装包`
```
tar zxvf lambda-0.3.2-release.tar.gz && cd lambda-0.3.2-release
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
