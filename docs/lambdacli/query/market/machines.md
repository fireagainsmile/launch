# lambdacli query market machines

## Description

Query all machines from address

## Usage
```
 lambdacli query market machines [address] [page] [limit] [flags]
```

Print help messages:
```
lambdacli query market machines -h
```

## Examples

Query the miner machines page 1 show 10
```
lambdacli query market machines lambda1h29mncmlezu2jsrsyvsg7vmd9zq8nt75mmqffw 1 10          
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
