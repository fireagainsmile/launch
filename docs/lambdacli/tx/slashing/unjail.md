# lambdacli tx slashing unjail validator

## Description

unjail a validator

## Usage

```
lambdacli tx slashing unjail [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for asset                                        |
| --from       |        | string     |                       |  Name or address of private key with which to sign                                        |

## Examples

```
lambdacli tx slashing unjail --from master

{"chain_id":"lambda--test","account_number":"6","sequence":"31","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"cosmos-sdk/MsgUnjail","value":{"address":"lambdavaloper1s8n3ffn9vrfpfamgtevvtze7yuva5q7g35a2lk"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  Height: 18953
  TxHash: AF844B699F1A435712F2E1FF7FC82EA334C87FAD1680ED0247B6FC412B2EDE88
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 26492
  Tags:
    - action = unjail
    - action = validator-unjailed
    - validator = lambdavaloper1s8n3ffn9vrfpfamgtevvtze7yuva5q7g35a2lk
```


# lambdacli tx slashing unjail partner validator

## Description

unjail a partner validator

## Usage

```
lambdacli tx slashing unjail-partner [flags]
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for asset                                        |
| --from       |        | string     |                       |  Name or address of private key with which to sign                                        |

## Examples

```
lambdacli tx slashing unjail-partner --from master

{"chain_id":"lambda--test","account_number":"6","sequence":"31","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"cosmos-sdk/MsgUnjailPartner","value":{"address":"lambdavaloper1s8n3ffn9vrfpfamgtevvtze7yuva5q7g35a2lk"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: y
Password to sign with 'master':
Response:
  Height: 18953
  TxHash: AF844B699F1A435712F2E1FF7FC82EA334C87FAD1680ED0247B6FC412B2EDE88
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 26492
  Tags:
    - action = unjail_partner
    - action = validator-unjailed
    - validator = lambdavaloper1s8n3ffn9vrfpfamgtevvtze7yuva5q7g35a2lk
```



