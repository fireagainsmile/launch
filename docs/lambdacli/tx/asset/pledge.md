# lambdacli tx asset pledge

## Description

lambda token Conversion  ulamb -> utbb

## Usage

```
lambdacli tx asset pledge [asset amount] [token amount] [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for asset                                        |
| --from       |        | string     |                       |  Name or address of private key with which to sign                                        |

## Examples

### pledge

```
lambdacli tx asset pledge 1utbb 1000ulamb --from master
{"chain_id":"lambda-test","account_number":"0","sequence":"13","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgAssetPledge","value":{"address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","asset":{"denom":"utbb","amount":"1"},"token":{"denom":"ulamb","amount":"1000"}}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  TxHash: 49EB432D9B7F2EC8426007670214CBE559B55A2D49BBBCE0E5DA8B63C226AC9C

```
