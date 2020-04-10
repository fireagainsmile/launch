# 质押
用户可通过质押节点或质押合伙人，获得对应的质押出块奖励。

```
./lambdacli tx staking delegate [validator-address] [amount] --from [your-account-name] --broadcast-mode block
./lambdacli tx staking delegate-partner [validator-address] [amount] --from [your-account-name] --broadcast-mode block
```
[节点质押命令](lambdacli/tx/staking/delegate.md)

[合伙人质押命令](lambdacli/tx/staking/delegate-partner.md)

# 反质押
用户可以通过反质押，解绑自己的质押币，反质押周期为21天，反质押周期内的质押币不会产生收益。

```
./lambdacli tx staking unbond [validator-address] [amount] --from [your-account-name] --broadcast-mode block
./lambdacli tx staking unbond-partner [validator-address] [amount] --from [your-account-name] --broadcast-mode block
```
[节点反质押命令](lambdacli/tx/staking/unbond.md)

[合伙人反质押命令](lambdacli/tx/staking/unbond-partner.md)

**注意事项**  
- 反质押周期内，不允许从同一节点反质押超过7次。  
- 反质押周期内，节点被惩罚了，反质押的币也会按照惩罚比例进行扣除。  
- 反质押周期内的质押币不会产生收益。  

# 转质押
用户可以通过转质押，将其在原节点上的质押币转质押到目标节点上，立即到账，转质押周期为21天，转质押周期内有收益。

```
./lambdacli tx staking redelegate [src-validator-addr] [dst-validator-addr] [amount] --from [your-account-name] --broadcast-mode block
```
[节点转质押命令](lambdacli/tx/staking/redelegate.md)

**注意事项**  
- 不允许转质押到同一节点（A -> A）。  
- 不允许在向A节点转质押的周期内（21天），再从A节点转质押到别的节点。  
- 转质押周期内，从同一原节点转质押到同一目标节点，不能超过7笔。  
- 转质押周期内，原节点被惩罚了，转质押的那部分币，仍会按照惩罚比例进行扣除。  

# 解禁
当节点对块进行双签，在最近的10000个块中对少于500个块签名会被jail，并扣除一定比例的tbb，禁闭期满之后，需要手动 unajil 节点重新参与出块。
如果节点自抵押低于 666.666666 个tbb（合伙人自抵押低于 33.333333 个tbb），也会被 jail，但不会扣除质押币。

双签受到的惩罚  
- 扣除 1% 质押的TBB  
- 监禁三天  

离线时间过长  
- 扣除 0.01% 质押的tbb  
- jail 10分钟  

```
./lambdacli tx slashing unjail --from [your-account-name] --broadcast-mode block
./lambdacli tx slashing unjail-partner --from [your-account-name] --broadcast-mode block
```

[unjail命令](lambdacli/tx/slashing/unjail.md)

