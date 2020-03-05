# 存储网络文件备份
 
以文件备份到`~/lambda_bak`目录为例  
## 创建目录
```
mkdir -p ~/lambda_bak/{lambda,lambdacli,minernode,storagenode}
```
## 验证节点文件备份
验证节点文件备份到`~/lambda_bak/lambda/`下
``` 
cp ~/.lambda/config/*  ~/lambda_bak/lambda/
cp -r ~/.lambda/identity ~/lambda_bak/lambda/
```

## lambdacli文件备份
lambdacli文件备份到`~/lambda_bak/lambdacli/`下
```
cp ~/.lambdacli/config/config.toml  ~/lambda_bak/lambdacli/
cp -r ~/.lambdacli/keys ~/lambda_bak/lambdacli/
```

## minernode文件备份
minernode文件备份到`~/lambda_bak/minernode/`下
```
cp ~/.lambda_miner/config/config.toml ~/lambda_bak/minernode/
cp ~/.lambda_miner/config/default_miner_key.json ~/lambda_bak/minernode/
cp -r ~/.lambda_miner/identity ~/lambda_bak/minernode/
```
注意：如果您的子矿工账户json文件不是`~/.lambda_miner/config/default_miner_key.json`，需要替换为对应json文件完整路径

## storagenode文件备份
storagenode文件备份到`~/lambda_bak/storagenode/`下
```
cp ~/.lambda_storage/config/config.toml ~/lambda_bak/storagenode/
cp -r ~/.lambda_storage/identity ~/lambda_bak/storagenode/
```

## 压缩备份文件
```
cd ~
tar -zcf lambda_bak.tar.gz ./lambda_bak/
```
注意妥善保存lambda_bak.tar.gz文件



