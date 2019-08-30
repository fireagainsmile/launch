# lambdacli query slashing params 

## Description

Query genesis parameters for the slashing module

## Usage

```
lambdacli query slashing params [flags]
```

Print help messages:
```
lambdacli query slashing params -h
```

## Examples

```
lambdacli query slashing params
   
Slashing Params:
  MaxEvidenceAge:          2m0s
  SignedBlocksWindow:      100
  MinSignedPerWindow:      0.500000000000000000
  DowntimeJailDuration:    10m0s
  SlashFractionDoubleSign: 0.050000000000000000
  SlashFractionDowntime:   0.010000000000000000
```
