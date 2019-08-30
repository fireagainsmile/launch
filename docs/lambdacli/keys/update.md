# lambdacli keys update

## Description

Change the password used to protect private key

## Usage

```
lambdacli keys update <name> <flags>
```

## Flags

| Name, shorthand | Default   | Description                                                  | Required |
| --------------- | --------- | ------------------------------------------------------------ | -------- |
| --help, -h      |           | help for update                                              |          |

## Examples

### Change the password of a given key

```shell
lambdacli keys update master
```

You'll be asked to enter the current password for your key.

```txt
Enter the current passphrase:
```

Then you'll be asked to enter a new password and repeat it.

```txt
Enter the new passphrase:
Repeat the new passphrase:
```

It will be done if you enter a new password that meets the criteria.

```txt
Password successfully updated!
```
