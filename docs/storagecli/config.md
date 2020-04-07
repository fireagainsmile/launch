# storagecli config

## Description

Create or query a Lamb CLI configuration file

## Usage
```
 storagecli config <key> [value] [flags]
```

## Examples
```
./storagecli config
[broker]
  dht_gateway_addr = "182.92.242.59:13000"
  validator_addr = "182.92.242.59:13659"

[gateway]
  access_key = "lambda"
  address = "0.0.0.0:9002"
  secret_key = "12345678"
```
