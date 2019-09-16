# Lambda Wallet Wallet Instructions
Version 0.2.11

A wallet supports the creation and management of multiple accounts in Chinese and English.


Download ：[https://github.com/LambdaIM/launch/releases/tag/Wallet0.2.11](https://github.com/LambdaIM/launch/releases/tag/Wallet0.2.11)



![avatar](img/wallethome@2x.png)


* Switch language
* Create an account
* Mnemonic into the validator program
* signatures and add an address to pledge system
* Import account
* Wallet home page description
* Transfer
* Export account profile
* Replace the Validator node used in the wallet
* Use LAMB for TBB
* View Validator info and pledges
* View Partner Information and Pledge
* Withdrawal reward

 
## Switch language

![avatar](img/lang@2x.png)

## Create an account
Click Create Wallet to go to the page where you created your wallet.

Enter the wallet name, password, confirm the wallet password, and click the Create button.

![avatar](img/create@2x.png)

Click the Create button to enter the mnemonic page

Please keep the mnemonic in order to restore the wallet later. Click Next Step to go to the next page. It is best to record the mnemonic on the paper. The mnemonic can also be imported into the node program.

![avatar](img/word@2x.png)

On the page that confirms the mnemonic, click on the word on the page in the order of the mnemonics just shown.

![avatar](img/select@2x.png)

Click on the completed page

![avatar](img/selectall@2x.png)

Click Export Keystore File to back up your wallet.

![avatar](img/file@2x.png)

Import the wallet again via lambda**********.keyinfo

Create an account with your wallet to complete this


## Mnemonic into the validator program


After creating the account, save the help record, and help the import support to the verification node program to import the mnemonic into the node.

Call the command line with lambdacli

```bash
./lambdacli keys add [name] --recover
```

Enter the password twice as prompted

```bash
Enter a passphrase to encrypt your key to disk:
Repeat the passphrase:
```
![avatar](img/zhujici.png)


If the address of the output account is consistent with the wallet, the import is successful.

**tips**
note that the mnemonic combination in the example is just a use case account

## signatures and add an address to pledge system
![avatar](img/sin@2x.png)
input some world, and then copy the data to the signature pledge system(https://validator.lambdastorage.com/#/)

![avatar](img/sin2@2x.png)

Click to add the address in the address list page pledge system

![avatar](img/sin3.png)

to add an address to pledge system


## Import account

Click the home import wallet to enter the page for importing accounts.


![avatar](img/import1@2x.png)   

Click on Choose Wallet Files to select the backup file for your account.

The backup file is suffixed with keyinfo. For example, the configuration file created by the wallet is lambda.keyinfo.

Enter the password when creating the wallet, enter the name of the new wallet, and click import to import the wallet.

![avatar](img/import2@2x.png)   


According to the mnemonic word import account, fill in the mnemonic word and set the password.




## Wallet home page description
Newly created account with a balance of 0 and no transaction history

![avatar](img/home2@2x.png)  

At the top is the navigation menu, click the Settings button to enter the settings page, click on the account address to copy the account

At the bottom is the information of the Validator node connected to the wallet, including the public key address of the node, the height of the block, and the time of the block.

The account has a transaction record

![avatar](img/home@2x.png)


## Transfer
Click the Transfer button on the home page to bring up the Transfer dialog box and fill in the transfer address and amount.

![avatar](img/send@2x.png)

Click Next to preview the transaction information, you can modify the gas 
![avatar](img/send3@2x.png)
click OK. The dialog box for entering the wallet password is displayed, and the wallet password is entered.

![avatar](img/pasword@2x.png)

Click Submit, wait for 10s or so to complete the transfer, the transfer success is as follows

![avatar](img/ok@2x.png)

Click View Detail to view transfer details

![avatar](img/view@2x.png)


## Export account profile

Click Keystore File Backup on the settings page to view the account backup file.

![avatar](img/set@2x.png)


## Replace the Validator node used in the wallet
Click Switch Validator on the settings page to go to the page to view the Validator information.

![avatar](img/info@2x.png)

Change the IP address of the node in the input box, click Submit, and the prompt message is as follows:

![avatar](img/ok2@2x.png)


## Use LAMB for TBB.

TBB can be used for pledge

![avatar](img/duihuan1@2x.png)

![avatar](img/duihuan2@2x.png)


## View Validator info and pledges
![avatar](img/valist@2x.png)
First column of my pledge list 

Second Column Authentication Node List 

Click to verify the node list

![avatar](img/valist2@2x.png)

Click to view the validation node details

![avatar](img/vainfo@2x.png)

Click on the pledge button to pledge

![avatar](img/zhiyainfo@2x.png)


## View Partner Information and Pledge
The first column, my pledge

The second list of partners.

![avatar](img/plist@2x.png)

Click the partner list to view all the partner information

![avatar](img/plist2@2x.png)

Click to view partner details

![avatar](img/pinfo@2x.png)

Click on the pledge button to pledge

![avatar](img/zhiya2@2x.png)



## Withdrawal reward

![avatar](img/wi@2x.png)
![avatar](img/wi1@2x.png)



