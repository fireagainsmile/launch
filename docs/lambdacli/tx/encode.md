# lambdacli tx encode

## Description
Encode transactions created with the --generate-only flag and signed with the sign command.  
Read a transaction from <file>, serialize it to the Amino wire protocol, and output it as base64.  
If you supply a dash (-) argument in place of an input filename, the command reads from standard input.

## Usage

```
lambdacli tx encode <file> <flags>
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

First you must use `lambdacli tx send` command with flag `generate-only` to generate a send recorder. Just like this.

```  
./lambdacli tx send <address> 1ulamb --from <address> --chain-id lambda-test --generate-only 

{"type":"auth/StdTx","value":{"msg":[{"type":"cosmos-sdk/MsgSend","value":{"from_address":"lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9","to_address":"lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7","amount":[{"denom":"ulamb","amount":"1"}]}}],"fee":{"amount":null,"gas":"200000"},"signatures":null,"memo":""}}
```


And then save the output in file `tx.json`.
```
./lambdacli tx send <address> 1ulamb --from <address> --chain-id lambda-test --generate-only > tx.json
```

Then read a transaction from `tx.json`, serialize it to the Amino wire protocol, and output it as base64
```
./lambdacli tx encode tx.json 

SPBiXe4KPKijYZoKFNbsdJc1T6PVZA+dFc4bwbAx/HMwEhSuLicyF6EqRdTlz2LAZ+CIwp0s8RoKCgV1bGFtYhIBMRIEEMCaDA==
```

