# lambdacli tx asset

## Description

lambda token Conversion utbb -> ulamb

## Usage

```
lambdacli tx asset drop [asset amount] [token amount] [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for asset                                        |
| --from       |        | string     |                       |  Name or address of private key with which to sign                                        |

## Examples

### drop
```$xslt
./lambdacli tx asset drop 1utbb 1000ulamb --from master 
{"chain_id":"lambda-test","account_number":"0","sequence":"15","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgAssetDrop","value":{"address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","asset":{"denom":"utbb","amount":"1"},"token":{"denom":"ulamb","amount":"1000"}}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  TxHash: D345196B9AFA3BF4FBFCAF9A2135949957AC8BE412986170E55C996F7C80B909

```
