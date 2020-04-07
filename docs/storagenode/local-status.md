# storagenode local-status

## Description

show all local statement status

## Usage

```
storagenode local-status [flags]
```

## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| --show-id   |  | show all statement uuid |

## Examples

```
 ./storagenode local-status --show-id
Active statement count: 6
Inactive statement count: 0
Active statements:
statement 0: uuid(d9f9d289-dc38-4780-8c48-7377ac621010), end_time(2020-04-10 06:40:29.952923546 +0000 UTC), expired_time(2020-04-10 09:42:52 +0800 CST)

```
