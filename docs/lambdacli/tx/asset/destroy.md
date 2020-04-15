# lambdacli tx asset destroy

## Description

lambda asset destroy 

## Usage

```
lambdacli tx destroy mint [amount+symbol] [flag]
```

## Flags

| Name,shorthand  | Type    | Required  | Default  | Description                                             |
| :-------------- | :------ | :-------- | :------- | :------------------------------------------------------ |
| -h, --help      |         |  false    |          |  Help for asset                                         |
| --from          | string  |  true     |          |  Name or address of private key with which to sign      |

## Examples

```
./lambdacli tx asset destroy 100uxxb --from lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn --broadcast-mode block
{"chain_id":"lambda-test-3.0","account_number":"0","sequence":"5","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgDestroyAsset","value":{"address":"lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn","asset":{"denom":"uxxb","amount":"100"}}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: Y
Password to sign with 'lambda-001':
Response:
  Height: 12591
  TxHash: D62F5864A5036CADF94096CE8DBD2734FE5BB1C892C9772CFADCAF8387C9B5D3
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 31825
  Tags: 
    - action = destroyAsset
    - address = lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn
    - symbol = uxxb
    - amount = 100
```
