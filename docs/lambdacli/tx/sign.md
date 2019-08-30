# lambdacli tx sign

## Description

Sign transactions in generated offline file. The file created with the --generate-only flag.

## Usage

```
lambdacli tx sign <file> <flags>
```

## Flags

| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for sign                                        |
| --append         | Bool  | true       | True                  | Attach a signature to an existing signature.               |
| --from           | String | true       |                       | Name or address of private key with which to sign |
| --offline        | Boole | true       | False                 | Offline mode.                                    |
| --print-sigs     | Bool  | true       | False                 | Print the address where the transaction must be signed and the signed address, then exit  |

## Examples

### Sign a send file 

First you must use `lambdacli tx send` command with flag `generate-only` to generate a send recorder. Just like this.

```  
lambdacli tx send <address> 1ulamb --from <address> --chain-id lambda-test --generate-only 

{"type":"auth/StdTx","value":{"msg":[{"type":"cosmos-sdk/MsgSend","value":{"from_address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","to_address":"lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7","amount":[{"denom":"ulamb","amount":"1"}]}}],"fee":{"amount":null,"gas":"200000"},"signatures":null,"memo":""}}
```


And then save the output in file `tx.json`.
```
lambdacli tx send <address> 1ulamb --from <address> --chain-id lambda-test --generate-only > tx.json
```

Then you can sign the offline file.
```
lambdacli tx sign tx.json --from=<key_name> 

{"type":"auth/StdTx","value":{"msg":[{"type":"cosmos-sdk/MsgSend","value":{"from_address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","to_address":"lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7","amount":[{"denom":"ulamb","amount":"1"}]}}],"fee":{"amount":null,"gas":"200000"},"signatures":[{"pub_key":{"type":"tendermint/PubKeySecp256k1","value":"A8wLxTD30uOdHNvAal9ZFdUzhBY5rOjr7LG9r1GkEtzX"},"signature":"iHFbP9OAMUePkE6E9C/kjdHybdBAM/dYj0002Wj7QxhrBBYdVvNP0X2xKRA2K+FIapJWZgAEMFpg/bB6U4Mtsg=="}],"memo":""}}
```


After that, you will get the detail info for the sign. Like the follow output you will see the signature 

**iHFbP9OAMUePkE6E9C/kjdHybdBAM/dYj0002Wj7QxhrBBYdVvNP0X2xKRA2K+FIapJWZgAEMFpg/bB6U4Mtsg==**

After signing a transaction, it could be broadcast to the network with [broadcast command](broadcast.md)