# 市场操作手册
## 市场说明
1. 任意用户可创建市场，创建市场需要消耗账户1000000LAMB(1LAMB=1000000ulamb)；
2. 用户可以通过质押的方式参与用户创建的市场的运营。   
3. 市场收益由挂单手续费、成单手续费、续期手续费组成。  
4. 市场中的每笔收入会按照市场质押比例来进行分配。 
5. 解散市场后，创建市场消耗的1000000LAMB和市场创建人分配到的市场收益，会退回到市场受益人账户中。 
6. 市场收益分配规则：  
   市场创建人收取总市场收益的10%。  
   市场质押人按照质押比例分配剩余的90%（市场创建人也在分配集合中）。

## 创建市场
创建市场需要消耗账户1000000LAMB(1LAMB=1000000ulamb) 。

```
 ./lambdacli tx market create-market --name [market-name] \
    --profit [profit_addr] \
    --fee-rate [fee-rate] \
    --commission-rate [commission-rate] --from [account]
```
- `[market-name]` 为创建的市场名称，长度3到16位，只能以小写英文字母开头，只能包含小写英文字母和数字。市场名称不能重复。  
- `[profit_addr]` 为市场受益人地址，提取市场收益后，市场创建人获得的总市场收益会发放到该地址。  
- `[fee-rate]`  为挂单手续费率。  
- `[commission-rate]`  为成单手续费率和续期手续费率。  

例如：
```
市场设置挂单手续费率=0.02，成单/续期手续费率=0.02  
矿工挂一个单价为5LAMB的200GB卖单，需要支付20LAMB（=5LAMB/GB * 200GB * 0.02）的挂单手续费。
用户购买一个单价为5LAMB的200GB卖单2个月，需要支付40LAMB（=5LAMB/GB/Month * 200GB * 2Month * 0.02）的成单手续费。
用户再续期上面这个成单1个月，需要支付20LAMB（=5LAMB/GB/Month * 200GB * 1Month * 0.02）的续期手续费。

以上可得出市场总计获得收益80LAMB。
用户A创建了该市场且质押了100wLAMB（即创建加质押总计200wLAMB），用户B质押了200wLAMB，用户C质押了100wLAMB。
则该市场总计质押了500wLAMB。

则市场收益分配：
用户A：36.8LAMB = 80LAMB * 10% + 80LAMB * 90% * (200w/500w) 
用户B：28.8LAMB = 80LAMB * 90% * (200w/500w) 
用户C：14.4LAMB = 80LAMB * 90% * (100w/500w) 
```

[创建市场命令](lambdacli/tx/market/create-market.md)

## 修改市场
```
 lambdacli tx market edit-market --commission-rate 0.01 --from master
```
可修改的市场参数：`--profit`、`--fee-rate`、`commission-rate`、`--order-price`

市场质押金额（包括创建市场的1000000LAMB）达到5000000LAMB后，可修改市场卖单的最低价格（`--order-price`），参数设置的最低价格不得小于1LAMB。

例如：  
一个市场修改市场最低价格为2LAMB后，则该市场中新挂的卖单价格不得小于2LAMB。


[修改市场命令](lambdacli/tx/market/edit-market.md)

## 市场质押
用户可通过质押市场，获得市场的手续费收益和佣金收益。
单次质押到市场的金额不得小于1000LAMB(1LAMB=1000000ulamb) 。 
```
./lambdacli tx market delegate [marketName] [amount] --from [your-account-name] --broadcast-mode block
```
[市场质押命令](lambdacli/tx/market/delegate.md)

## 查询市场质押收益

```
./lambdacli query market delegation [marketName] [address]
```
[查询质押市场收益](lambdacli/query/market/delegate.md)

## 提取市场收益

```
lambdacli tx market withdraw-market [marketName] --from acc
```
[提取质押市场收益](lambdacli/tx/market/withdraw-market.md)

**注意事项**

- 提取收益为全部提取
- 质押金不可随意反质押，需要市场满足解散条件后，由市场创建人解散市场后，该市场的质押金会自动返还到账户中

## 解散市场

```
lambdacli tx market dismiss --from acc
```

[解散市场](lambdacli/tx/market/dismiss.md)

**注意事项**

- 解散市场只能由市场创建人发起
- 解散市场条件需要满足
    - 市场中没有有效的卖单 
    - 市场中没有有效的成单