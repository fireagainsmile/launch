# storagecli cp

## Description

Copy object to another location locally or in Lambda

## Usage
```
storagecli cp ACCOUNT srcPath [dstPath] [flags]
```
## Flags

| Name, shorthand| Default   | Description | Required                                                                  |
| --------------- | ----   | -------- | --------------------- 
|--debug   |  | enable debug log out |



## Examples

```
LAMBDA_ORDER_ID=A845A8FCA6BA74182BDE93648FD10818CD4F973F  ./storagecli cp mj /root/upload/eclipse-committers-2019-09-R-macosx-cocoa-x86_64.dmg  lamb://test1/ --home /root/LambdaIM/storage/storage-master-472d1a1-debug-01082103/.lambda_storagecli --debug
2020-04-05T15:52:14.550+0800	DEBUG	broker/upload.go:152	Upload 	{"Size": 366477387}
2020-04-05T15:52:14.555+0800	DEBUG	broker/upload.go:160	Upload 	{"Offset": 0}
0 / 439772864 [________________________________________________________________________________________________________________________________________________________________________________] 0.00% ? p/s2020-03-11T15:52:14.959+0800	DEBUG	broker/upload.go:269	start prepare piece	{"bucket": "test1", "prefix": "eclipse-committers-2019-09-R-macosx-cocoa-x86_64_12faf064b6874b8c8090a4c99848714b.dmg", "pieceId": 0}
2020-04-05T15:52:14.959+0800	DEBUG	broker/upload.go:297	Upload 	{"piece_index": 0}
2020-04-05T15:52:14.961+0800	DEBUG	piecestore/upload.go:161	start upload piece 0, size 13421773
2020-04-05T15:52:14.961+0800	DEBUG	piecestore/upload.go:76	send 32768 to storage
2020-04-05T15:52:14.961+0800	DEBUG	piecestore/upload.go:76	send 32768 to storage
2020-04-05T15:52:14.962+0800	DEBUG	piecestore/upload.go:76	send 32768 to storage

```
