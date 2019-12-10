# storage0.1.2升级

* [清除历史数据](#清除历史数据)
* [初始化storagenode](#初始化storagenode)
* [重启storagenode](#重启storagenode)

### 清除历史数据

```
version填写版本号,  比如：v0.1.1
directory填写数据存储目录，默认/root/.lamborage。
```

1.显示清理历史storagecli的数据列表
```
./storagecli helper clean [version] --dry_run 
```
2.清理历史storagecli的数据
```
./storagecli helper clean [version]  
```
3.显示清理历史的storagenode数据列表
```
./storagecli helper clean [version] --dry_run --storage_node_home [directory]
```
4.清理历史storagenode数据
```
./storagecli helper clean [version] --storage_node_home [directory]
```

### 初始化storagenode

清理数据后需要重新初始化storagenode
```
./storagenode init
```
### 重启storagenode

```
使用kill命令停掉storagenode server 和storagenode gateway

启动storagenode server:  
./storagenode server --daemonize --log.file storage-server.log

启动storagenode gateway:
./storagenode gateway --daemonize  --debug --log.file storage-gateway.log

```
