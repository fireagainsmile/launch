# 市场质押
用户可通过质押市场，获得市场的手续费收益和佣金收益

```
./lambdacli tx market delegate [marketName] [amount] --from [your-account-name] --broadcast-mode block
```
[市场质押命令](lambdacli/tx/market/delegate.md)

# 查询市场质押收益

```
./lambdacli query market delegation [marketName] [address]
```
[查询质押市场收益](lambdacli/query/market/delegate.md)

# 提取市场收益

```
lambdacli tx market withdraw-market [marketName] --from acc
```
[提取质押市场收益](lambdacli/tx/market/withdraw-market.md)

**注意事项**

- 提取收益为全部提取
- 质押金不可随意反质押，需要市场满足解散条件后，由市场创建人解散市场后，该市场的质押金会自动返还到账户中

[解散市场](lambdacli/tx/market/dismiss.md)

```
lambdacli tx market dismiss --from acc
```

**注意事项**

- 解散市场只能由市场创建人发起
- 解散市场条件需要满足
    - 市场中没有有效的卖单 
    - 市场中没有有效的成单