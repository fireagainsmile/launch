# lambdacli keys list

## Description

Return a list of all public keys stored by this key manager
along with their associated name and address.

## Usage

```
lambdacli keys list <flags>
```

## Flags

| Name, shorthand | Default   | Description                                                  | Required |
| --------------- | --------- | ------------------------------------------------------------ | -------- |
| --help, -h      |           | help for delete                                              |          |
| --force, -f     |   false   | Remove the key unconditionally without asking for the passphrase | false |
| --yes, -y       |   false   | Skip confirmation prompt when deleting offline or ledger key references | false |                                              |          |

## Examples

### List all public keys 

```shell
lambdacli keys list
```

You'll get all the local public keys with 'address' and 'pubkey' element.

```txt
$ ./lambdacli keys list
NAME:   TYPE:   ADDRESS:                                        PUBKEY:
master  local   lambda1v7rq4afpf47wfq4qymyaa9mvvvq69f7f6k7cv9   lambdapub1addwnpepq0xqh3fs7lfw88gum0qx5h6ezh2n8pqk8xkw36lvkx7675dyztwdww453lm
peter   local   lambda12ege5pja3mrzaz6dcwueqw737a8lnyke2ypec7   lambdapub1addwnpepqfmwljhhupxq5e37fyu955485802pcf78u42au7nrdmrunk60wnsqs63gy8
```
