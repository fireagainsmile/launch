# lambdacli tx send

## Description

Sending tokens to another address

## Usage

```bash
lambdacli tx send <to_address> <amount> [flags]
```

## Flags

| Name,shorthand   | Type   | Required | Default               | Description                                                  |
| ---------------- | ------ | -------- | --------------------- | ------------------------------------------------------------ |
| --from           | String | true       |                       | Name or address of private key with which to sign |

## Examples

### Send tokens to another address

```bash
lambdacli tx send lambda1ah8pfpnx00m75w07lajk7jsfaz4x780upxa3xx 10000000utbb --from master
```
