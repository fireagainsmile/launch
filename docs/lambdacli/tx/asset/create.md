# lambdacli tx asset create

## Description

lambda asset create, the symbol prefix must be 'u', the token amount must be 1000,000LAMB(1000,000,000,000ulamb)

## Usage

```
lambdacli tx asset create [amount+symbol] [amount+token] [flag]
```

## Flags

| Name,shorthand  | Type    | Required  | Default  | Description                                             |
| :-------------- | :------ | :-------- | :------- | :------------------------------------------------------ |
| -h, --help      |         |  false    |          |  Help for asset                                         |
| --asset-name    | string  |  false    |          |  Asset Full Name                                        |
| --mintable      | bool    |  false    |          |  Whether it can inflate assets                          |
| --from          | string  |  true     |          |  Name or address of private key with which to sign      |

## Examples
```$xslt
./lambdacli tx asset create 1000uxxb 1000000000000ulamb --asset-name "XBB Coin" --mintable --from lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn --broadcast-mode block
{"chain_id":"lambda-test-3.0","account_number":"0","sequence":"3","fee":{"amount":null,"gas":"200000"},"msgs":[{"type":"lambda/MsgCreateAsset","value":{"address":"lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn","asset":{"denom":"uxxb","amount":"1000"},"token":{"denom":"ulamb","amount":"1000000000000"},"name":"XBB Coin","mintable":true}}],"memo":""}

confirm transaction before signing and broadcasting [Y/n]: Y
Password to sign with 'lambda-001':
Response:
  Height: 12358
  TxHash: 2F17114965B74F60585A1BF58D85B09A3D7C8859B285FA8A96C8790104C25BEA
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: 200000
  GasUsed: 49520
  Tags: 
    - action = createAsset
    - address = lambda17am6rkcsm6sguy57rwr5fpkuezp620wfxsgkzn
    - name = XBB Coin
    - symbol = uxxb
    - amount = 1000
    - mintable = true
```
