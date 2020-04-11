# 矿工维护手册

矿工因升级或其他理由需要暂时停止提供服务时，可执行矿工维护命令 使矿工进入维护状态。矿工维护完成后，可执行解除维护命令 恢复活跃。

1. 区块链内最多允许50个矿工同时进行维护；  
2. 30天内，单个矿工累计维护时长不允许超过3天；  
3. 30天内，如矿工累计维护时长超过3天，矿工会被监禁； 
4. 超过5000次未成功响应挑战，矿工会被监禁；
5. 被监禁的矿工，可使用`lambdacli tx market unjail`解禁，同时会扣除矿工账户余额100LAMB。

### 查看矿工状态
矿工状态：  
Status = 0, 活跃状态    
Status = 1, 正在维护（执行矿工维护命令后，会变为此状态）  
Status = 2, 矿工被禁（维护时长超过72小时 或 超过5000次未成功响应挑战）

注意：如果`MissedPDPChallenge`增长，表明矿工未成功响应挑战的次数在增长，矿工需要检查自己的挖矿程序。该数值等于5000时，矿工会被监禁。
``` 
./lambdacli query market miner [miner_address]

例如：
./lambdacli query market miner lambda16mk8f9e4f73a2eq0n52uux7pkqclcues6pkg40
Miner
  Operator Address:           lambdamineroper16mk8f9e4f73a2eq0n52uux7pkqclcuesww60qj
  Status:                     0 //表示该矿工为活跃状态
  AllSize:                    1000.000000000000000000
  UseSize:                    180.000000000000000000
  MatchSize:                  180.000000000000000000
  DhtId:                      5CS8tUKpcjkEtB3VbJgCwoEL3G4W39G4yC2LYF15ft3q
  PeerId:
  OrderPledge:                900000000ulamb
  OrderReward:                1200000000ulamb
  LastWithDrawTime:           1970-01-01 00:00:00 +0000 UTC
  MiningAddress:              lambda14w3vuyehk5l7hf5p7p5ks0napy3wkggunt96uq
  MissedPDPChallenge:         0 //矿工未成功响应挑战的次数
```

### 矿工维护
矿工因升级或其他理由需要暂时停止提供服务时，可执行以下矿工维护命令
``` 
./lambdacli tx market maintain --from [miner_account] --broadcast-mode block -y

例如：账户名为miner1的矿工需要维护
./lambdacli tx market maintain --from miner1 --broadcast-mode block -y
``` 

### 矿工解除维护
矿工维护完成后，可执行以下解除维护命令
``` 
./lambdacli tx market unmaintain --from [miner_account] --broadcast-mode block -y
``` 

### 矿工解禁
被监禁的矿工，可使用以下命令解禁，同时会扣除矿工账户余额100LAMB
``` 
./lambdacli tx market unjail --from [miner_account] --broadcast-mode block -y
``` 



