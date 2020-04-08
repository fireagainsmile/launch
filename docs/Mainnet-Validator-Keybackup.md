# 备份和恢复节点签名文件
## 备份节点签名文件
命令：
``` 
./lambda key backup -m [qr|text] -k [backup_file_path]
```
-m 可指定生成的备份文件格式，默认为qr二维码图片，text为文本文件  
-k 可指定生成的备份文件所在路径，不指定该参数时为当前路径

例如：  
指定生成的备份文件为二维码图片到~/LambdaIM目录：
``` 
./lambda key backup -m qr -k ~/LambdaIM
```
按提示输入密码，执行成功后 会新生成备份文件~/LambdaIM/private_key_file.png

**注意**  

妥善保存 密码 和 生成的备份文件（二维码private_key_file.png或文本文件private_key_file）

## 恢复节点签名文件
丢失节点签名文件`~/.lambda/config/priv_validator_key.json`后，可使用备份的文本文件、二维码文件 或`./lambda init`初始化命令执行成功后显示的seeds 进行恢复  
命令：
``` 
./lambda key recover -m [qr|text|seeds] -k [backup_file_path]
```
-m 可指定备份文件格式，默认为qr二维码图片；text为文本文件；指定为seeds时，需输入`./lambda init`初始化命令执行成功后显示的seeds字符串  
-k 可指定备份文件所在路径，不指定该参数时为当前路径    
-f 如`~/.lambda/config/priv_validator_key.json`文件已存在，加上该参数可强制覆盖原文件  

例如：  
``` 
指定使用二维码图片~/LambdaIM/private_key_file.png恢复：
./lambda key backup -m qr -k ~/LambdaIM/private_key_file.png

指定使用文本文件~/LambdaIM/private_key_file恢复：
./lambda key backup -m text -k ~/LambdaIM/private_key_file
```
按提示输入密码，执行成功后 会生成文件`~/.lambda/config/priv_validator_key.json`
