# lambdacli query dam market

## Description

Query digital asset market by asset name

## Usage:

```
 lambdacli query dam market [assetName] [flags]
```

- `assetName`: market info of the denom of asset

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help     |        | False    |                       | help for market                                             |
| --ledger       | String | False    |                       | Use a connected Ledger device                                |
| --node         | String | False    | tcp://localhost:26657 | `<host>:<port>`to tendermint rpc interface for this chain    |
| --trust-node   | String | False    | True                  | Don't verify proofs for responses                            |


## Examples
```
./lambdacli query dam market uabc
DigitalAssetMarket
  marketName:           boss-market
  assetName:            uabc
  owner:                lambda105jf3p5qkrnq973xmc6e9f8asly79sv7phcrym
  exchangeRatio:        10
  pledgePool:           10000000
  createMarketCost:     1000000000000
  authorizedPubKeys:    [PubKeyEd25519{D9EDCFD488030AFFD4249EC3962198954A283A16BA4AC26DCC6E29CFC09F6FD2}]
  totalPower:           0
  topAssetMinerNum:     0
  assetMinerNum:        1
```

