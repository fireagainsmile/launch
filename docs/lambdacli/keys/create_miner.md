# lambdacli keys create-miner

## Description

Create an raw private key(json formatted), it used for miners to run miner-node server

## Usage

```
lambdacli keys create-miner <storage-name> [flags]
```

## Flags

## Flags

| Name, shorthand | Default   | Description                                                  | Required |
| --------------- | --------- | ------------------------------------------------------------ | -------- |
| --help, -h      |           | help for create-miner                                              |          |
| --output-dir    |           | Set the output dir to detrive private key file (default ".") | false |

## Examples

### Create a new key

```shell
lambdacli keys create-miner miner
```

You'll be asked to enter bip39 mnemonic for your master account. The miner account will be associated to master account

```txt
Enter your bip39 mnemonic:
```

After that, you're done with creating a miner account key. The generated key file will looks like below:

```json
{
  "privateKey": "15f6146d686b2df1813dd8e75c6c4cfb4f796ea8ebc02b543e05b17859074c78",
  "publicKey": "022e804959097dfaa694627fc8743abf6e96875dfd3b9e3e72929b18bb171aab27",
  "masterAddress": "lambda15z35mmuckjxdus9wjp658kvql75jrrnynhfh6c",
  "address": "lambda1mkayje85385kf2vjm870vzpgcwwzldkk8elhvf"
}
```

Then move this key file to your mining device to start minernode service
