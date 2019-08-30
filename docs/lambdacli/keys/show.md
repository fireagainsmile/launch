# lambadcli keys show

## Description

Return public details of one local key.

## Usage

```
lambdacli keys show <name> <flags>
```

## Flags

| Name, shorthand      | Default           | Description                                                    | Required |
| -------------------- | ----------------- | -------------------------------------------------------------- | -------- |
| --address            |                   | output the address only (overrides --output)                   |          |
| --bech               | acc               | The Bech32 prefix encoding for a key (acc/val/cons)   |          |
| --help, -h           |                   | help for show                                                  |          |
| --multisig-threshold | 1                 | K out of N required signatures                          |          |
| --pubkey             |                   | output the public key only (overrides --output)                |          |
| -m, --show-multisig  |                   | Output multisig pubkey constituents, threshold, and weights                |          |

## Examples

### Show a given key

```shell
lambdacli keys show master
```

You'll get the local public keys with 'address' and 'pubkey' element of a given key.

```txt
NAME:   TYPE:   ADDRESS:                                        PUBKEY:
master  local   lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9   lambdapub1addwnpepq0xqh3fs7lfw88gum0qx5h6ezh2n8pqk8xkw36lvkx7675dyztwdww453lm
```

### Show Validator Operator Address

If an address has bonded to be a validator operator, then you could use `--bech val` to get the operator's address:

```$xslt
lambdacli keys show master --bech val
```

Then you could see the following:
```$xslt
NAME:   TYPE:   ADDRESS:                                        PUBKEY:
master  local   lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3    lambdavaloperpub1addwnpepq0xqh3fs7lfw88gum0qx5h6ezh2n8pqk8xkw36lvkx7675dyztwdwz0xms6
```

The result could be use for `--address-validator` in [create a delegation](../tx/staking/delegate.md)