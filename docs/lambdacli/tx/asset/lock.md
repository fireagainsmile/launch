# lambdacli tx asset lock

## Description

lambda chain token lock

## Usage

```
lambdacli tx asset lock [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for asset                                        |
| --from       |    string    |  true    |                       |  Name or address of private key with which to sign                                        |
| --amount       |    string    |  true    |                       |  lock token symbol and token amount                                        |
| --duration       |    string    |  false    |         24h              |  lock duration time                                       |

## Examples

### lock

```$xslt
./lambdacli tx asset lock --amount 100ulamb --duration 1h --from master                                  
{"chain_id":"songtest","account_number":"0","sequence":"6","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgLockAsset","value":{"address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","asset":{"denom":"ulamb","amount":"100"},"lock_duration":"3600000000000"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  TxHash: 61F3341D6A68A2A76192D4B7F2E2CE57DFB087BCC1AADED300FCCA63D491C96F

```
