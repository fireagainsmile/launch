# Software Upgrade

## Basic Description

Lambda chain supports this feature. After a passed `SoftwareUpgradeProposal`, lambda chain will be upgraded to the new version  and fully compatible with the historical blockchain data.

## How to upgrade software

###  Governance process of software upgrade proposal
1. Submit a software upgrade proposal
2. Deposit amount of `ulamb` until reach `min_deposit` defined in gov module
3. Vote `yes` to pass the proposal

### The process of software upgrade   
1. Install a new software.
2. Once reach the `switch-height` determined by `SoftwareUpgradeProposal`, the software will be upgraded.	 

## Command details

submit proposal
```
./lambdacli tx gov submit-proposal software-upgrade upgrade.json --from <key_name> --gas-prices 0.5ulamb
```

`upgrade.info` includes the proposal's details, it should look like this
```json
{
	"title": "Software Upgrade",
	"description": "Upgrade to new version",
	"version": "1",
	"software": "https://github.com/LambdaIM/launch/releases/tag/v0.3.0",
	"switch_height": "50",
	"threshold": "0.8",
	"deposit": [{
		"denom": "ulamb",
		"amount": "520000000"
	}]
}
```

Query the version details of current software 
```
./lambdacli query info
```

