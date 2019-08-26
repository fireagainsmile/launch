# Lambda Wallet 钱包使用说明
版本 0.1.1 一个钱包支持一个账号，新建账号之前的账号配置文件会被覆盖，请注意备份账号配置文件，避免账号信息丢失

![avatar](img/wallethome@2x.png)

* [创建账号](#创建账号)
* [助记词倒入到节点的验证程序](#助记词倒入到节点的验证程序)
* [签名和添加地址到质押系统](#签名和添加地址到质押系统)
* [导入账号](#导入账号)
* [钱包首页说明](#钱包首页说明)
* [转账](#转账)
* [导出账号配置文件](#导出账号配置文件)
* [更换钱包链接的Validator节点](#更换钱包链接的Validator节点)
* [查看验证节点和质押](#查看验证节点和质押)
* [查看合伙人和质押](#查看合伙人和质押)


## 切换语言

![avatar](img/lang@2x.png)
## 创建账号
点击 Create Wallet  进入创建钱包的页面

输入钱包名称，密码，确认钱包密码，点击 Create 按钮，

![avatar](img/create@2x.png)

点击 Create按钮后，进入助记次页面


请妥善保管助记词，以便以后恢复钱包，点击Next Step进入下一页
最好在纸片上记录下助记次，助记词也可以导入到节点程序中。

![avatar](img/word@2x.png)

在确认助记词的页面，按照刚才显示的助记词顺序，点击页面上的单词

![avatar](img/select@2x.png)

点击完成后的页面

![avatar](img/selectall@2x.png)

点击 Export Keystore File  以便备份钱包。

![avatar](img/file@2x.png)

通过lambda**********.keyinfo可以再次导入钱包

通过钱包创建账号到此完成
##助记词倒入到节点的验证程序
创建账号后，保存好助记次，助记次支持导入到验证节点程序中
助记词导入到节点

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

##签名和添加地址到质押系统
![avatar](img/sin@2x.png)
输入签名，然后复制签名数据到质押系统(https://validator.lambdastorage.com/#/)
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
##查看合伙人和质押
第一列 我的质押
第二列 合伙人列表
![avatar](img/plist@2x.png)
点击合伙人列表 查看全部的合伙人信息
![avatar](img/plist2@2x.png)
点击查看合伙人详情
![avatar](img/pinfo@2x.png)
点击质押按钮可以进行质押
![avatar](img/zhiya2@2x.png)


