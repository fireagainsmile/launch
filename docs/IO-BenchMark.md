# 磁盘性能测试

## 安装sysbench命令（如果有此命令，请忽略安装步骤）

### CentOS系统执行如下命令

```
sudo yum list
sudo yum install sysbench
```

### Ubuntu系统执行如下命令

```
sudo apt-get update -y
sudo apt-get install -y sysbench
```

### 验证sysbench是否安装成功

```
sysbench --version
```

### 执行benchmark测试脚本，需要等待10min左右

```
sudo ./benchmark_io.sh
Begin BenchMark Test, Will Cost Sometime ...
BenchMark:
    IOPS: 1539
    Latency(ms): 0.28
```

*注：社区建议磁盘IOPS的数值应不小于1000，Latency不超过0.5ms*


### 可能存在的问题

```
sudo ./benchmark_io.sh
Begin BenchMark Test, Will Cost Sometime ...
./benchmark_io.sh:行28: bc: 未找到命令
./benchmark_io.sh:行29: bc: 未找到命令
BenchMark:
    IOPS: 
    Latency(ms): 0.28
```

此问题由于系统没有`bc`程序导致，CentOS可运行`sudo yum -y install bc`安装，
Ubuntu可运行`sudo apt-get install bc`




