# storagenode info

## Description

about storage information

## Usage

```
storagenode info [command]
```

## Available Commands

| Name| Description                                                                   |
| --------------- | --------------------- 
| disk  | show storage disk info|
|  index | storage index info|
|  network | show storage network info|

## Examples

```
 ./storagenode --home /root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/.lambda_storage info disk
               version:  0.2.5-2-g14a1883
  storage.storage_name:  t4s5
      storage.data_dir:  [/data/storage/store /data3/storage/store /root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/.lambda_storage/storage/store]

Disk                                                                                                                        |Total   |Used   |Free    |Order                                    |Occupied
/data/storage/store                                                                                                         |187 GiB |47 GiB |140 GiB |51866A6BBB6E2EE819D921D85094E76D1D54410A |116 MiB
                                                                                                                            |        |       |        |A60DF26061D0A98D4F9338AAC8A0683BD0927429 |11 GiB
                                                                                                                            |        |       |        |A62C0765A24CB031686B06A6C1EB0F508E625F1E |9.4 GiB
                                                                                                                            |        |       |        |D7A999F935192C313913FEF25EC9F3B2EC199819 |8.3 GiB
                                                                                                                            |        |       |        |F083BC34E5CC1E2E6DBD20F0A274A70252DCCBC3 |1.3 GiB
/data3/storage/store                                                                                                        |18 GiB  |18 GiB |0 B     |A60DF26061D0A98D4F9338AAC8A0683BD0927429 |18 GiB
/root/LambdaIM/storage/storage-feature_order_list_with_provider_status-984f41e-debug-03251653/.lambda_storage/storage/store |37 GiB  |33 GiB |4.2 GiB |A60DF26061D0A98D4F9338AAC8A0683BD0927429 |7.0 GiB
```

# storage index info
## Usage

```
 storagenode info index [flags]
```

## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
|--rebuild    |  | rebuild local storage index |

## Examples

```
./storagenode info  index --rebuild
This could take long time depends on your file trees...

indexing  /lambda/data/store
 /EAB528223F77D8AB7894298F01A2280D42085BF8/test > 762 records

/root/.lambda_storage/storagedb   updated.
762 records in total
time elasped: 9.59795602s

```
# show storage network info
## Usage

```
show storage network info
```

## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
| --dht-id    |  | show dht id |
| --test    |  | test if the configuration is correct |

## Examples

```
./storagenode info network --dht-id
ETj21L2dWgxPfCr5ocRDYeRXb9rREjWM5B2gox6UatYP

./storagenode info network --test
               version: 0.2.5-debug
                dht id: ETj21L2dWgxPfCr5ocRDYeRXb9rREjWM5B2gox6UatYP
  storage.storage_name: t4
 storage.miner_address: 172.17.159.132:14001 	 successful
server.private_address: 172.17.159.132:15001 	 successful
        server.address: 172.17.159.132:15000 	 successful
  kad.external_address: 182.92.242.59:15000 	 successful
    kad.bootstrap_addr: [182.92.242.59:13000] 	  successful
```
