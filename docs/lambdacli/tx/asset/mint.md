# lambdacli tx asset mint

## Description

lambda asset mint, only asset creators can use this command 

## Usage

```
lambdacli tx asset mint [amount+symbol] [flag]
```

## Flags

| Name,shorthand  | Type    | Required  | Default  | Description                                             |
| :-------------- | :------ | :-------- | :------- | :------------------------------------------------------ |
| -h, --help      |         |  false    |          |  Help for asset                                         |
| --from          | string  |  true     |          |  Name or address of private key with which to sign      |

## Examples

```
./lambdacli tx asset mint 1000uxxb --from lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn --broadcast-mode block
{"chain_id":"lambda-test-3.0","account_number":"0","sequence":"4","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgMintAsset","value":{"address":"lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn","asset":{"denom":"uxxb","amount":"1000"}}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: Y
Password to sign with 'lambda-001':
Response:
  Height: 12550
  TxHash: 18FA340B1CA3B273AA5B03C7FC4E760E65D3963B95209AF13ECE87F8B796FF12
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 32805
  Tags: 
    - action = mintAsset
    - address = lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn
    - symbol = uxxb
    - mintable = 1000
```
