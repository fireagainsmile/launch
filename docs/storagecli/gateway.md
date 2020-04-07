# storagecli gateway run

## Description

run local gateway --account [account] --debug

## Usage
```
 storagecli gateway run [flags]
```
## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
|--account   |  | specify account to use |
|--broker.db_path   |  | local gateway data directory |
|--broker.dht_gateway_addr   |  | remote dht gateway address |
|--broker.extra_key_file  |  | local path of extra key file |
|--broker.extra_order_id   |  | local gateway extra order id |
|--broker.validator_addr   |  | remote validator address |
|--debug  |  | enable debug log output |
|--gateway.access_key | accesskey | local gateway access key |
|--gateway.address   |  | local gateway address |
|--gateway.secret_key   | secretkey | local gateway secret key|




## Examples

```
./storagecli gateway run --account mj --broker.extra_order_id A62C0765A24CB031686B06A6C1EB0F508E625F1E  --broker.dht_gateway_addr 182.92.242.59:13000 --broker.validator_addr 182.92.242.59:13659 --gateway.access_key lambda --gateway.secret_key 12345678 --debug
sync single order begin, This may take some time...
http://182.92.242.59:13659/market/user/matchorders/lambda1ejuhsxthm7kpjz63eczlg28prrfje9vd22ma3x
WARN: remote match order not found: A62C0765A24CB031686B06A6C1EB0F508E625F1E
Starting local s3 gateway at:  0.0.0.0:9002

```
