# lambdacli tx asset ruin

## Description

lambda asset ruin, only asset creators can use this command 

## Usage

```
lambdacli tx asset ruin [symbol] [flag]
```

## Flags

| Name,shorthand  | Type    | Required  | Default  | Description                                             |
| :-------------- | :------ | :-------- | :------- | :------------------------------------------------------ |
| -h, --help      |         |  false    |          |  Help for asset                                         |
| --from          | string  |  true     |          |  Name or address of private key with which to sign      |

## Examples

```$xslt
./lambdacli tx asset ruin uxxb --from lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn --broadcast-mode block
{"chain_id":"lambda-test-3.0","account_number":"0","sequence":"9","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgRuinAsset","value":{"address":"lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn","symbol":"uxxb"}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: Y
Password to sign with 'lambda-001':
Response:
  Height: 12812
  TxHash: F22F89134088EC797EBAFF2FFDE8BA0D869A09A4911D563EB93C26C37C2026F6
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 61609
  Tags: 
    - action = ruinAsset
    - address = lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn
    - symbol = uxxb
```
