# Lambda钱包使用说明
版本 0.3.11 

一个钱包支持创建和管理多个账户，支持语言有中文和英文。


下载地址 ：[https://github.com/LambdaIM/launch/releases/tag/Wallet0.3.11](https://github.com/LambdaIM/launch/releases/tag/Wallet0.3.11)



![avatar](img/wallethome@2x.png)

* [创建账号](#创建账号)
* [助记词导入到节点的程序包](#助记词导入到节点的程序包)
* [签名和添加地址到质押系统](#签名和添加地址到质押系统)
* [导入账号](#导入账号)
* [钱包首页说明](#钱包首页说明)
* [转账](#转账)
* [导出账号配置文件](#导出账号配置文件)
* [更换钱包链接的Validator节点](#更换钱包链接的Validator节点)
* [LAMB兑换TBB](#LAMB兑换TBB)
* [查看验证节点和质押](#查看验证节点和质押)
* [转质押](#转质押)
* [查看合伙人和质押](#查看合伙人和质押)
* [提取奖励](#提取奖励)
* [提取节点收益](#提取节点收益)
* [查看资产和交易资产](#查看资产和交易资产)
* [提案与存入押金和投票](#提案与存入押金和投票)

## 切换语言

![avatar](img/lang@2x.png)
## 创建账号
点击 Create Wallet  进入创建钱包的页面

输入钱包名称，密码，确认钱包密码，点击 Create 按钮，

![avatar](img/create@2x.png)

点击 Create按钮后，进入助记词页面


请妥善保管助记词，以便以后恢复钱包，点击Next Step进入下一页
最好在纸片上记录下助记词，助记词也可以导入到节点程序中。

![avatar](img/word@2x.png)

在确认助记词的页面，按照刚才显示的助记词顺序，点击页面上的单词

![avatar](img/select@2x.png)

点击完成后的页面

![avatar](img/selectall@2x.png)

点击 Export Keystore File  以便备份钱包。

![avatar](img/file@2x.png)

通过lambda**********.keyinfo可以再次导入钱包

通过钱包创建账号到此完成

## 助记词导入到节点的程序包

验证节点和矿工可以将钱包中的账号导入到挖矿程序包中(lambda chain)，运行挖矿程序

创建账号后，保存好助记词，助记词支持导入到验证节点和矿工的程序中

例如 助记词导入到节点的程序包

使用lambdacli调用命令行

```bash
./lambdacli keys add [name] --recover
```

根据提示两次输入密码

```bash
Enter a passphrase to encrypt your key to disk:
Repeat the passphrase:
```
![avatar](img/zhujici.png)


看到后面输出账户的地址如果和钱包一致，则表示导入成功

**tips**
注意，示例里面的助记词组合只是一个用例账户

## 签名和添加地址到质押系统
通过在钱包中签名，然后添加到质押系统中，可以确保这个地址是属于你的，而不是别人的。

![avatar](img/sin@2x.png)
输入内容例如输入签名2个字，然后复制签名数据到质押系统(https://validator.lambdastorage.com/#/)
![avatar](img/sin2@2x.png)
在质押系统地址列表页面点击 添加地址
![avatar](img/sin3.png)
即可添加地址到质押系统

## 导入账号

点击首页 import wallet  进入导入账号的页面

![avatar](img/import@2x.png)   

点击 Choose Wallet Files 选择账号的备份文件

备份文件后缀为 keyinfo,例如钱包创建的配置文件为lambda.keyinfo

输入创建钱包时候的密码，再输入新的钱包的名称，点击 import ,即可导入钱包

## 钱包首页说明
新创建的账号，余额为0，也没有交易记录

![avatar](img/home2@2x.png)  

顶部是导航菜单，点击设置按钮进入设置页面，点击账号地址可以复制账号

底部是钱包连接的Validator 节点的信息，包含节点的公钥地址，区块的高度，出块时间

账号有了交易记录的效果图

![avatar](img/home@2x.png)


## 转账
点击首页的 Transfer 按钮 ，弹出转账对话框，填写转账的地址和金额

![avatar](img/send@2x.png)

点击下一步，预览交易信息，可以修改gas
![avatar](img/send3@2x.png)
点击确定。弹出输入钱包密码的对话框，输入钱包密码

![avatar](img/pasword@2x.png)

点击Submit，等待10s左右转账完成,转账成功效果如下

![avatar](img/ok@2x.png)

点击View Detail 查看转账详情

![avatar](img/view@2x.png)

## 导出账号配置文件

在设置页面点击 Keystore File Backup,即可查看账号备份文件

![avatar](img/set@2x.png)

## 更换钱包链接的Validator节点
在设置页面点击 Switch Validator 进入 查看Validator信息的页面

![avatar](img/info@2x.png)

在输入框里面更改节点的IP地址,点击 Submit，切换成功后提示信息如下 

![avatar](img/ok2@2x.png)


## LAMB兑换TBB

TBB可用于质押

![avatar](img/duihuan1@2x.png)

![avatar](img/duihuan2@2x.png)




## 查看验证节点和质押
![avatar](img/valist@2x.png)
第一列 我的质押列表
第二列 验证节点列表
点击到验证节点 列表
![avatar](img/valist2@2x.png)
点击查看验证节点详细信息
![avatar](img/vainfo@2x.png)
点击质押按钮进行质押
![avatar](img/zhiyainfo@2x.png)

##转质押
在节点的详情页面点击转质押按钮
![avatar](img/WXrv1@2x.png)
点击即可打开转质押窗口

填写需要转质押多少tbb，选择新的节点即可

（如果要转全部tbb，可能会失败，建议质押总量-0.1 个tbb 转质押比较容易成功）

![avatar](img/WXr2@2x.png)







## 查看合伙人和质押
第一列 我的质押
第二列 合伙人列表
![avatar](img/plist@2x.png)
点击合伙人列表 查看全部的合伙人信息
![avatar](img/plist2@2x.png)
点击查看合伙人详情
![avatar](img/pinfo@2x.png)
点击质押按钮可以进行质押
![avatar](img/zhiya2@2x.png)

## 提取奖励

![avatar](img/wv3@2x.png)
![avatar](img/wi1@2x.png)


## 提取节点收益
在首页点击提取下来菜单中的提取节点收益菜单
![avatar](img/wv1@2x.png)
即可打开提取节点收益的窗口
![avatar](img/wv2@2x.png)


## 查看资产和交易资产
在钱包首页点击资产标签，可以查看当前账户下有哪些资产
![avatar](img/asset1@2x.png)
点击交易按钮可以打开交易资产的窗口
![avatar](img/asset2@2x.png)

## 提案与存入押金和投票
点击顶部的导航菜单中的提案，即可进入提案列表页面
![avatar](img/t1@2x.png)
点击提案的的文字描述部分进入提案详情页面
![avatar](img/t2@2x.png)

在提案的状态为【存入押金】状态时候，可以给提案存入押金
点击存入押金按钮打开存入押金对话框
![avatar](img/t3@2x.png)
当押金满足要求后，提案会进入投票状态，点击投票按钮打开投票对话框

![avatar](img/t4@2x.png)
投票可以选择 同意 、反对、强烈反对、弃权

如果第一次投票投错了，没关系第二次投票会覆盖第一次涂票的结果

投票的权重等于质押量，在节点质押和在合伙人质押都是有效质押

如果没有质押过，投票无效


