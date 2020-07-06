# Application development guide 
## configuration 

### client configuration

```   plain
wget http://download.lambdastorage.com/lambda/0.4.9/lambda-0.4.9-testnet.tar.gz
mkdir -p ~/LambdaIM && cd ~/LambdaIM
tar zxvf lambda-0.4.9-testnet.tar.gz && cd lambda-0.4.9-testnet
./lambdacli config node tcp://47.93.196.236:26657
./lambdacli config chain-id lambda-chain-test4.9
./lambdacli config trust-node true
```
* test net available endpoints：
```   plain
./lambdacli config node tcp://47.93.196.236:26657
./lambdacli config node tcp://47.94.129.97:26657
./lambdacli config node tcp://39.105.148.217:26657
./lambdacli config node tcp://182.92.66.63:26657
```
### create a new account and write down the mnemonic words

* mnemonic words is used to recover the account, make sure you have saved carefully.


```   plain
./lambdacli keys add user1
```
output
```   plain
Enter a passphrase to encrypt your key to disk:
Repeat the passphrase:
NAME:	TYPE:	ADDRESS:					PUBKEY:
user1	local	lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6	lambdapub1addwnpepqdjpeayr7xf7cn74n3t7hcnt6567qlwune7g5uf008qsak4yd60qczc9ulg
**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.
## mnemonic words
year bag cupboard tiny whip street want lake rabbit gesture father obvious index xx xxxx scrap convince xxx elegant hood rent luggage forward trade
```
1. Get lamb test token

test net faucet:


[http://faucet.lambdastorage.com/](http://faucet.lambdastorage.com/)

query available lamb amount:

```   plain
./lambdacli query account lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
```
output：
```   plain
Account:
  Address:       lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
  Pubkey:
  Coins:         100000000000ulamb
  AccountNumber: 486
  Sequence:      0
```
* The basic unit in lambda blockchain is 'u', 1lamb = 1000000ulamb

## issuing  a asset(optional)

Create a new coin named as pig which is used as a payment for storage for example, the minimum unit of asset is 'u', 1000000lamb token is locked while send the transaction. 

### issuing the asset

```   plain
./lambdacli tx asset create 100000000000000upig 1000000000000ulamb --asset-name "pig Coin" --mintable --from lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6  --broadcast-mode block
```
output：
```   plain
{"chain_id":"lambda-chain-test4.9","account_number":"485","sequence":"0","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateAsset","value":{"address":"lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6","asset":{"denom":"upig","amount":"100000000000000"},"token":{"denom":"ulamb","amount":"1000000000000"},"name":"pig Coin","mintable":true}}],"memo":""}
confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  Height: 460520
  TxHash: 84B01755F40A0EB98CF621DBA230CE4A14AF91BC7CE991340672B3BA71D3EC58
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 49903
  Tags:
    - action = createAsset
    - address = lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
    - name = pig Coin
    - symbol = upig
    - amount = 100000000000000
    - mintable = true
```
### query account property

```   plain
./lambdacli query account 
 lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
```
output：
```   plain
Account:
  Address:       lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
  Pubkey:        lambdapub1addwnpepqdjpeayr7xf7cn74n3t7hcnt6567qlwune7g5uf008qsak4yd60qczc9ulg
  Coins:         1000000000000ulamb,100000000000000upig,1000000000utbb
  AccountNumber: 485
  Sequence:      1
```
### transfer property

```   plain
./lambdacli tx send  lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8 100000000upig --from user1
```
output：
```   plain
{"chain_id":"lambda-chain-test4.9","account_number":"485","sequence":"1","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"cosmos-sdk/MsgSend","value":{"from_address":"lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6","to_address":"lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8","amount":[{"denom":"upig","amount":"100000000"}]}}],"memo":""}
confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  TxHash: 680CC553CD23CC6951865C97635691F1FA1D35A669E5A12BF83DFF025C5D2F0E
```
### query transaction detail

```   plain
./lambdacli query tx 680CC553CD23CC6951865C97635691F1FA1D35A669E5A12BF83DFF025C5D2F0E -o json
```
output：
```   plain
{
  "height": "460638",
  "txhash": "680CC553CD23CC6951865C97635691F1FA1D35A669E5A12BF83DFF025C5D2F0E",
  "raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
  "logs": [
    {
      "msg_index": "0",
      "success": true,
      "log": ""
    }
  ],
  "gas_wanted": "200000",
  "gas_used": "28486",
  "tags": [
    {
      "key": "action",
      "value": "send"
    },
    {
      "key": "sender",
      "value": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6"
    },
    {
      "key": "address",
      "value": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6"
    },
    {
      "key": "recipient",
      "value": "lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8"
    },
    {
      "key": "address",
      "value": "lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8"
    }
  ],
  "tx": {
    "type": "auth/StdTx",
    "value": {
      "msg": [
        {
          "type": "cosmos-sdk/MsgSend",
          "value": {
            "from_address": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6",
            "to_address": "lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8",
            "amount": [
              {
                "denom": "upig",
                "amount": "100000000"
              }
            ]
          }
        }
      ],
      "fee": {
        "amount": null,
        "gas": "200000"
      },
      "signatures": [
        {
          "pub_key": {
            "type": "tendermint/PubKeySecp256k1",
            "value": "A2Qc9IPxk+xP1ZxX6+Jr1TXgfdyefIpxL3nBDtqkbp4M"
          },
          "signature": "wZkaj51BfeXgZGNlOeehv/d00PWDFJkLyLj/viB1HSIuCXVg2GS1H25jczh/kcA8BRnidVCbeqI+7A8QYwDeGw=="
        }
      ],
      "memo": ""
    }
  },
  "timestamp": "2020-05-12T05:29:32Z"
}
```
### Query property API 

testnet available endpoint list:    

```   plain
47.93.196.236:13659
47.94.129.97:13659
39.105.148.217:13659
182.92.66.63:13659
```
#### Query property api path

/auth/accounts/{address}

testnet interface：

```   plain
http://47.93.196.236:13659/auth/accounts/lambda1v664znyhztfx3m0v0uua497r5cptg3rd2ytnm8
```
output：
```   javascript
 //查找coins 中denom 为 ulamb 即可
{
    "type": "auth/Account",
    "value": {
        "address": "lambda1v664znyhztfx3m0v0uua497r5cptg3rd2ytnm8",
        "coins": [{
            "denom": "ubtc",
            "amount": "1000000"
        }, {
            "denom": "ulamb",
            "amount": "3000000"
        }],
        "public_key": null,
        "account_number": "502",
        "sequence": "0"
    }
}
```
#### query transaction using api path

txs/{txhash}

testnet interface：

```   plain
http://47.93.196.236:13659/txs/680CC553CD23CC6951865C97635691F1FA1D35A669E5A12BF83DFF025C5D2F0E
```
output：
```   json
{
  "height": "460638",
  "txhash": "680CC553CD23CC6951865C97635691F1FA1D35A669E5A12BF83DFF025C5D2F0E",
  "raw_log": "[{\"msg_index\":\"0\",\"success\":true,\"log\":\"\"}]",
  "logs": [
    {
      "msg_index": "0",
      "success": true,
      "log": ""
    }
  ],
  "gas_wanted": "200000",
  "gas_used": "28486",
  "tags": [
    {
      "key": "action",
      "value": "send"
    },
    {
      "key": "sender",
      "value": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6"
    },
    {
      "key": "address",
      "value": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6"
    },
    {
      "key": "recipient",
      "value": "lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8"
    },
    {
      "key": "address",
      "value": "lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8"
    }
  ],
  "tx": {
    "type": "auth/StdTx",
    "value": {
      "msg": [
        {
          "type": "cosmos-sdk/MsgSend",
          "value": {
            "from_address": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6",
            "to_address": "lambda1lxsnz2udquwhs7vm622m3rm552ghssvhqrefp8",
            "amount": [
              {
                "denom": "upig",
                "amount": "100000000"
              }
            ]
          }
        }
      ],
      "fee": {
        "amount": null,
        "gas": "200000"
      },
      "signatures": [
        {
          "pub_key": {
            "type": "tendermint/PubKeySecp256k1",
            "value": "A2Qc9IPxk+xP1ZxX6+Jr1TXgfdyefIpxL3nBDtqkbp4M"
          },
          "signature": "wZkaj51BfeXgZGNlOeehv/d00PWDFJkLyLj/viB1HSIuCXVg2GS1H25jczh/kcA8BRnidVCbeqI+7A8QYwDeGw=="
        }
      ],
      "memo": ""
    }
  },
  "timestamp": "2020-05-12T05:29:32Z"
}
```

#### transfer properties

##### get chain-id

```   plain
/node_info
```
testnet interface：
```   plain
http://47.93.196.236:13659/node_info
```
output：
```   json
{
  "protocol_version": {
    "p2p": "7",
    "block": "10",
    "app": "0"
  },
  "id": "e02882af5bdafa5aec086c32b8398c268d2337f1",
  "listen_addr": "47.93.196.236:26656",
  "network": "lambda-chain-test4.9", //chain-id
  "version": "0.4.9-goleveldb",
  "channels": "4020212223303800",
  "moniker": "cv-moniker-1",
  "other": {
    "tx_index": "on",
    "rpc_address": "tcp://0.0.0.0:26657"
  }
}
```
##### get user account sequence

```   plain
/auth/accounts/{address}
```
testnet interface：
```   plain
http://47.93.196.236:13659/auth/accounts/lambda16cheh6j34ncyunwgfkq2940cs8222jka0fsp4k
```
output：
```   json
{
  "type": "auth/Account",
  "value": {
    "address": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6",
    "coins": [
      {
        "denom": "ulamb",
        "amount": "999959200000"
      },
      {
        "denom": "upig",
        "amount": "99999900000000"
      }
    ],
    "public_key": {
      "type": "tendermint/PubKeySecp256k1",
      "value": "A2Qc9IPxk+xP1ZxX6+Jr1TXgfdyefIpxL3nBDtqkbp4M"
    },
    "account_number": "485",   
    "sequence": "7"   
  }
}
```
##### calculate transaction fee(gas)

interface

```   plain
/bank/accounts/${senderAddress}/transfers
type post
data format json
```
testnet interface：
```   plain
http://47.93.196.236:13659/bank/accounts/lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6/transfers
```
transaction content

```   json
{
    "base_req": {
        "sequence": "7", //input sequence
        "from": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6",//account address
        "account_number": "485", //input account_number
        "chain_id": "lambda-chain-test4.9", //set chain-id
        "simulate": true,
        "memo": ""
    },
    "amount": [{
        "amount": "1000000", //basic unit is 'u'
        "denom": "ulamb"  //token name
    }],
    "from_address": "lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6",
    "to_address": "lambda16cheh6j34ncyunwgfkq2940cs8222jka0fsp4k"
}
```
output：
```   plain
  {"gas_estimate":"28077"}
```
##### sign the transaction data

```   json
{
    "account_number": "485",  //query from user info
    "chain_id": "lambda-chain-test4.9", //blockchain id, get from the latest blockchain info 
    "fee": {//transaction fee
        "amount": [{
            "amount": "101745",
            "denom": "ulamb" 
        }],
        "gas": "40698"  //gas
    },
    "memo": "", 
    "msgs": [{
        "type": "cosmos-sdk/MsgSend", //transaction type
        "value": {
            "amount": [{
                "amount": "1000000",   
                "denom": "ulamb"    
            }],
            "from_address": "lambda1prrcl9674j4aqrgrzmys5e28lkcxmntx2gm2zt",  
            "to_address": "lambda1hynqrp2f80jqs86gu8nd5wwcnek2wwd3esszg0"   
        }
    }],
    "sequence": "7"  
}
```
##### sending a transaction

interface

```   plain
/txs
```
testnet interface
```   plain
http://47.93.196.236:13659/txs
type post
data format json
```
transaction details

```   plain
{
    "tx": {
        "msg": [{
            "type": "cosmos-sdk/MsgSend",
            "value": {
                "amount": [{
                    "amount": "1000000", //1lamb
                    "denom": "ulamb"
                }],
                "from_address": "lambda1prrcl9674j4aqrgrzmys5e28lkcxmntx2gm2zt",
                "to_address": "lambda1hynqrp2f80jqs86gu8nd5wwcnek2wwd3esszg0"
            }
        }],
        "fee": {
            "amount": [{
                //amount = gas * gas price
                //gas price is set as 0.025ulamb, adjust this value to adjust the fee size.
                "amount": "701", 
                "denom": "ulamb"
            }],
            "gas": "28077" //gas price
        },
        "signatures": [{  
            "signature": //signature result
"fa9bUlNRA3qa9PEYR2py6CgpQbbqVsuKhJRowMdlf90byj7M/2B1YQsu6EPAk1V/tLkKiNwEadkAKNFUxZngGA==",
            "pub_key": {
                "type": "tendermint/PubKeySecp256k1",
                "value": "AjmQ01Z+IoHuKLdPaFzV6IJQB88ahW2qv2rEw2H4B5dq"  //public key
            }
        }],
        "memo": ""
    },
    "mode": "block"    use 'async' to send transaction asynchronously, and use 'block' to send transaction synchronously     
}
```
### Blockchain API list

[http://docs.lambda.im/api-reference/paths/](http://docs.lambda.im/api-reference/paths/)

## Storage miner access(self-built storage seller)

[http://docs.lambda.im/Testnet-Miner-Guide/](http://docs.lambda.im/Testnet-Miner-Guide/)

## Buy storage space

### query storage miner selling space list

```   plain
./lambdacli query market miner-sellorders  lambda1r3my74gqyt8zfgqu358nv86nqncxu34cs0ek44 1 100
```
output：
```   plain
ID                                         PRICE    RATE     TOTAL    AVAIABLE STATUS   CREATE_TIME          MIN_BS   MIN_BT   MAX_BT   ADDR
1951F346F2A1AC19DE282ACF3557DA14D54001D1   5LAMB    1.00     1024     0        1        2020-03-06,13:16:48  1        90DAYS   1800DAYS lambdamineroper1r3my74gqyt8zfgqu358nv86nqncxu34cyq43qg
3BD7E4142C2BD393E1EF3FF983D49758F99F8178   5LAMB    1.00     1024     0        1        2020-03-04,11:59:22  1        30DAYS   1800DAYS lambdamineroper1r3my74gqyt8zfgqu358nv86nqncxu34cyq43qg
4EACCB414C75DBE73B897F452D7BA76DA9FA6011   5LAMB    1.00     1024     0        1        2020-03-20,10:04:35  4        120DAYS  1320DAYS lambdamineroper1r3my74gqyt8zfgqu358nv86nqncxu34cyq43qg
806326624BE6764.974CFF229B8FF30C37F658A0   5LAMB    1.00     500      0        1        2020-04-23,06:15:37  10       360DAYS  360DAYS  lambdamineroper1r3my74gqyt8zfgqu358nv86nqncxu34cyq43qg
9F491F6FE92D664798E774DCFD77F64828B47756   5LAMB    1.00     1024     0        1        2020-03-04,11:05:50  1024     30DAYS   1800DAYS lambdamineroper1r3my74gqyt8zfgqu358nv86nqncxu34cyq43qg
C516EF2E4778E6078D87949E582C245B4D2CBBF5   5LAMB    1.00     1024     0        1        2020-03-11,08:46:12  1        90DAYS   360DAYS  lambdamineroper1r3my74gqyt8zfgqu358nv86nqncxu34cyq43qg
```
sell order description:
| Field   | Description   |
|:----|:----|
| NODE   | show node status with Online or Offline   |
| ID   | sell order id   |
| MIN_BS   | Minimum purchase space   |
| MIN_BT   | Minimum purchase time   |
| MAX_BT   | Maximum purchase time   |
| ADDR   | Miner Address   |

### Buy storage space 
Here is an example of buying a 5G storage for one month from storage miner selling list:


```   plain
./lambdacli tx market create-buyorder --duration 1month --market-name lambdamarket --size 5GB --from user1 --broadcast-mode block --sellorder-id 761E89B5CA7D2988D72F3F2FC5AC4CDD10DDDCC1
```
output：
```   plain
{"chain_id":"lambda-chain-test4.9","account_number":"485","sequence":"6","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateBuyOrder","value":{"address":"lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6","duration":"2592000000000000","size":"5","sellOrderId":"761E89B5CA7D2988D72F3F2FC5AC4CDD10DDDCC1","marketName":"lambdamarket"}}],"memo":""}
confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'user1':
Response:
  Height: 461738
  TxHash: 92B748DF4956A86E7948942ACE1FDFA5965E85D037E37A8B5901DE8069C517B1
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 55745
  Tags:
    - action = createBuyOrder
    - address = lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
    - orderId = 60E003E7414DEEF9A7C5F89997980CE7666EF220
    - buyOrder = 0a283630453030334537343134444545463941374335463839393937393830434537363636454632323012149372c8fe27338c648289684dac33aaea1261db881a013520808088ba90adcd042a110a05756c616d62120834303030303030303228373631453839423543413744323938384437324633463246433541433443444431304444444343313a283432304346414645413538424545413439313843433834454233393933383141463745343445453642145de544b0ed7b6178f73dfdc26d976c41a49b9fd04a0c08a197e9f50510e2d1d8f202
    - matchOrder = 0a28343230434641464541353842454541343931384343383445423339393338314146374534344545361214d6ec7497354fa3d5640f9d15ce1bc1b031fc73301a149372c8fe27338c648289684dac33aaea1261db882228373631453839423543413744323938384437324633463246433541433443444431304444444343312a28363045303033453734313444454546394137433546383939393739383043453736363645463232303207383030303030303a0135420c08a197e9f50510e2d1d8f2024a0c08a1b187f70510e2d1d8f2025080c0e285e3685a0c08a197e9f50510e2d1d8f2026a145de544b0ed7b6178f73dfdc26d976c41a49b9fd072110a05756c616d62120834303030303030307a110a05756c616d6212083430303030303030
```
### query order list

```   plain
./lambdacli query market  matchorders lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6 1 100
```
outputs：
```   plain
MatchOrder
  OrderId:               420CFAFEA58BEEA4918CC84EB399381AF7E44EE6
  AskAddress:            lambdamineroper16mk8f9e4f73a2eq0n52uux7pkqclcuesww60qj
  BuyAddress:            lambda1jdev3l38xwxxfq5fdpx6cva2agfxrkugrflur6
  SellOrderId:           761E89B5CA7D2988D72F3F2FC5AC4CDD10DDDCC1
  BuyOrderId:            60E003E7414DEEF9A7C5F89997980CE7666EF220
  Price:                 8000000
  Size:                  5
  CreateTime:            2020-05-12 07:09:21.7773984.9 +0000 UTC
  EndTime:               2020-06-11 07:09:21.7773984.9 +0000 UTC
  CancelTimeDuration:    1h0m0s
  WithDrawTime:          2020-05-12 07:09:21.7773984.9 +0000 UTC
  Status:                0
  MarketAddress:         lambdamarketoper1thj5fv8d0dsh3aealhpxm9mvgxjfh87srk3887
  UserPay:               40000000ulamb
  MinerPay:              40000000ulamb
  PeerId:
  DhtId:                 5CS8tUKpcjkEtB3VbJgCwoEL3G4W39G4yC2LYF15ft3q
```
## Storage service
Lambda storage providing two versions of gateway for a compatible part of the S3 interface:    

* s3gateway  For a single order gateway，Mainly to facilitate the user migration of data
* lambgw       for multiple order gateway，For application developers with more business needs


This document describes lambGW only


### Guidelines for developing applications with LambGW

lambdaGW currently supporting: 

* multiple orders in lambda storage net(reflected as multiple bucket)
* daemon service
* update order interface
* role management



not supporting：

* S3  multipart api, user shall adjust the multipart_threshold field to avoid using this. 



#### Usage 1（recommended）
Developers transfer files to lambgw by using their own upload and download api.


For developers：

* Use your own file upload download API to receive files and transfer to lambGW
* Manage file mapping
* Manage application order related business
* Manage the users of the application
  

How to deploy：

* Expose application service api to public 
* The internal network communicates with LambGW with only one accesskey(configuration file).
* The user only calls the application API
  


#### Usage 2（pending）

Developers only cares orders、user related services，use S3 api to transfer files via lambgw.

in this case：

* lambgw support to assign permissions to accesskey
* Developers need to bind their users to the corresponding lambgw accesskey(update permissions when committing an order)
* Developers manage the user storage usage(This part have to be implemented in the client, since we don't have a data gateway)
* Developers manage the order mapping( lambgw should only care about verify permission and store data, because we think order mapping is application business)



How to deploy：

* Expose application service api to public 
* Expose lambgw to public
* The user needs to invoke two sets of apis，each user of the application uses their own accesskey



### configure lambgw

initialization：

```   plain
wget http://download.lambdastorage.com/lambda-storage/0.2.5/lambda-storage-0.2.5-testnet.tar.gz
mkdir -p ~/LambdaIM && cd ~/LambdaIM
tar zxvf lambda-storage-0.2.5-testnet.tar.gz && cd lambda-storage-0.2.5-testnet
./storagecli init
```
Configure the S3 port and access KEY：

```   
cat ~/.lambda_storagecli/config/user.toml
[gateway]
# The address at which the service listens
address = "127.0.0.1:9002"
# The key used to access the service
access_key = "accesskey"
secret_key = "secretkey"
```
### running lambgw

```   shell
./storagecli lambgw run --account user1 --daemonize --log.file /tmp/gateway.log
```
--account    the account used to buy storage space



#### check lambgw call api history log

view the api call history log:

`./storagecli lambgw admin trace --verbose`



#### lambgw refresh order list

cll `ListBucket` with 'root accesskey'(accesskey in configuration file) will update the order book, it is very the same with `token sync`    



### aws cli example

install [awscli](https://docs.aws.amazon.com/cli/latest/userguide/installing.html).

config accessing s3 gateway key:

```   plain
$ aws configure
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]:
Default output format [None]:
```
config multipart threshold

```   shell
aws configure set default.s3.multipart_threshold 512MB
```



##### upload files

```   plain
aws s3 --endpoint=http://localhost:9002/ cp /path/to/your/file s3://ORDERID
```
##### list bucket 

```   plain
aws s3 --endpoint=http://localhost:9002/ ls s3://ORDERID
```
##### download files

```   plain
aws s3 --endpoint=http://localhost:9002/ cp s3://ORDERID/your-file /tmp/new-file
```
