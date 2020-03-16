# lambdacli keys repair

## Description

repair keys db

## Usage

```
lambdacli keys repair [flags]
```

## Flags

| Name, shorthand | Default   | Description                                                       | Required |
| ---------------   | --------- | ----------------------------------------------------------------- | -------- |
| --help, -h        |           | Help for repair                                                      |          |

## Examples

### Repair keys db

```shell
lambdacli keys repair
```

If your keys db is abnormal and the cmd runs success，will response like this:

```txt
repair successful, keys db: /root/.lambdacli/keys/keys.db
```
If keys db is normal，the cmd will response like this:

```txt
no repair required, keys db: /root/.lambdacli/keys/keys.db
```
