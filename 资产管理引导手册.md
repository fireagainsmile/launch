# 简介
## 资产角色
1. 资产创建人：创建该资产的人  
2. 资产持有人：账户内拥有该资产的人（包含资产创建人）  

## 资产说明 
1. 资产以token的形式存储在Lambda链上。  
2. 任意Lambda账户都可以创建资产, 创建资产需要消耗一定量的LAMB(100万)。资产最大发行量为900亿。  
3. 创建资产的账户地址拥有该资产的初始总量，可以对该资产进行增发和毁灭。  
4. 资产持有人可以进行资产转账，锁定、解锁、销毁，所有交易需要消耗LAMB作为手续费。
5. 毁灭资产会返还创建时消耗的90%的LAMB到原账户(即返还90万LAMB)  

## 命令行操作演示
- [创建资产](./docs/lambdacli/tx/asset/create.md)
- [资产转账](./docs/lambdacli/tx/send.md) 转账方式同ulamb/utbb转账
- [资产增发](./docs/lambdacli/tx/asset/mint.md)
- [锁定资产](./docs/lambdacli/tx/asset/lock.md)
- [解锁资产](./docs/lambdacli/tx/asset/unlock.md)
- [销毁资产](./docs/lambdacli/tx/asset/destroy.md)
- [毁灭资产](./docs/lambdacli/tx/asset/ruin.md)
- [查询账户余额](./docs/lambdacli/query/account.md)
- [查询锁定资产信息](./docs/lambdacli/query/asset/lock.md)
- [查询指定资产类型信息](./docs/lambdacli/query/asset/symbol.md)
- [查询全网所有资产类型信息](./docs/lambdacli/query/asset/all.md)


