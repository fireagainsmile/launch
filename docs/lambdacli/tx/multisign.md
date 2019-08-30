# lambdacli tx multisign

## Description

Sign the same transaction by multiple accounts. The tx could be broadcast only when the number of signatures is greater than or equal to the minimum number of signatures.


## Usage
```
lambdacli tx multisign <file> <key name> <[signature]...> <flags>
```

## Flags
| Name,shorthand | Type   | Required | Default               | Description                                                  |
| -------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| -h, --help       |        | false     |                       |  Help for sign                                        |

## Example

### Create multisig account 

Firstly, you must create a multisig account, please refer to [add](../keys/add.md)

Create a multisig account with 3 sub-accounts，specify the minimum number of signatures，such as 2. The tx could be broadcast only when the number of signatures is greater than or equal to 2.

```  
lambdacli keys add <multi_account_keyname> --multisig-threshold=2 --multisig=<signer_keyname_1>,<signer_keyname_2>,<signer_keyname_3>...
```

::: tips
<signer_keyname> could be the type of "local/offline/ledger"， but not "multi" type。

Offline account can be created by "lambdacli keys add --pubkey". 
:::

### Generate tx with multisig account

Create Tx and generate Tx-generate.json :
```  
lambdacli tx send <address> <amount> --from=<multi_account_keyname> --chain-id=<chain-id> --generate-only > Tx-generate.json
```

### Sign the tx separately

Use `lambdacli keys show <multi_account_keyname>` to get `<multi_account_address>`

Specify the threshold to 2， sign and generate Tx-sign.json.

Sign the tx with signer_1:
```  
lambdacli tx sign Tx-generate.json --name=<signer_keyname_1> --chain-id=<chain-id> --multisig=<multi_account_address> --signature-only >Tx-sign-user_1.json
```

Sign the tx with signer_2:
```  
lambdacli tx sign Tx-generate.json --name=<signer_keyname_2> --chain-id=<chain-id> --multisig=<multi_account_address> --signature-only >Tx-sign-user_2.json
```

### multisign all the signatures

Create the signed tx and generate Tx-signed.json：

```  
lambdacli tx multisign --chain-id=<chain-id> Tx-generate.json <multi_account_keyname> Tx-sign-user_1.json Tx-sign-user_2.json > Tx-signed.json
```


### Broadcast the signed tx

After signing a transaction, it could be broadcast to the network with [broadcast command](broadcast.md)

```  
lambdacli tx broadcast Tx-signed.json --commit
```
