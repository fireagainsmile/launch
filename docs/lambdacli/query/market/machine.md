# lambdacli query market machine

## Description

Query the machine info from address and machine name

## Usage
```
 lambdacli query market machine [address] [machineName]
```

Print help messages:
```
lambdacli query market machine -h
```

## Examples

Query machine info by address and machine name
```
lambdacli query market machine lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw machineOne         
```

```
Machine
  Name:           machineOne
  Owner:          lambdamineroper1h29mncmlezu2jsrsyvsg7vmd9zq8nt7505vwun
  PubKey:         PubKeyEd25519{23C3FA106D3A76EBBF7CFD0C97BB6D9923F733FF97E7707BE95D1371B84CC184}
  PeerId:         lambdakjinah1nczjeka
  DhtId:          FqtQvNFpxtmUgZvGHMgUrNE5xXobEDvXBHC5Ko8cf1E7
  Status:         1
  MatchSize:      0
```
