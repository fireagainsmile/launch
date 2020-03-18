# lambdacli query market sequence

## Description

Query the sequence symbol key

## Usage
```
lambdacli query market sequence [marketAddress] [flags]
```

Print help messages:
```
lambdacli query market sequence -h
```

## Examples

Query the sequence symbol key with marketAddress
```
lambdacli query market sequence lambdamarketoper1thj5fv8d0dsh3aealhpxm9mvgxjfh87srk3887
```

```
SequenceSymbol
  Cursor:            10FCA01DE9B04AC231E475930EB33E387C5F139B
  SequenceSize:      1
  SequenceList:      [Ele
  Key:   10FCA01DE9B04AC231E475930EB33E387C5F139B
  Value:
  {Prev:    10FCA01DE9B04AC231E475930EB33E387C5F139B, Next:    10FCA01DE9B04AC231E475930EB33E387C5F139B}
]
```
