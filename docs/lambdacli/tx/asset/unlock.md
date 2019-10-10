# lambdacli tx asset unlock

## Description

lambda chain token unlock

## Usage

```
lambdacli tx asset unlock [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for asset                                        |
| --from       |   string     | true     |                       |  Name or address of private key with which to sign                                        |
| --symbol       |  string      |   true   |                       |  unlock token symbol                                      |

## Examples

### unlock
```$xslt
./lambdacli tx asset unlock --symbol ulamb --from master                                      
{"chain_id":"song_test1","account_number":"0","sequence":"23","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgUnLockAsset","value":{"address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","symbol":"ulamb"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  TxHash: 783D36382C31BCDA36A9D92AD1EC2697EB0292FC80293FFF124B38B51FB00CF2

```
