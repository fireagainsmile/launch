# Join the mainnet

## Download Latest Release Pack

Currently the latest release version is v0.3.0. You could click [here](https://github.com/LambdaIM/launch/releases/download/v0.3.0/lambda-0.3.0-release.tar.gz) to download

## Setting Up a New Node

The following instructions will demonstrate how to set up a brand new full node from scratch.

First, initialize necessary config files

```bash
./lambda init [moniker]
```

You can edit this `moniker` later, in the `~/.lambda/config/config.toml` file:

```toml
# A custom human readable name for this node
moniker = "<your_custom_moniker>"
```

You can edit the `~/.lambda/config/lambda.toml` file in order to enable the anti spam mechanism and reject incoming transactions with less than the minimum gas prices:

```toml
# The minimum gas prices a validator is willing to accept for processing a
# transaction. A transaction's fees must meet the minimum of any denomination
# specified in this config (e.g. 10ulamb).

minimum-gas-prices = ""
```

**tips**
The recommended `min-gas-prices` is `0.25ulamb`, but you might want to change it as you wish. 

Your full node has been initialized! 

## Genesis & Seeds

### Copy the Genesis File

Download latest lambda release pack and unzip it. Copy `genesis.json` to the specific path.

```bash
\cp -rf ./genesis.json ~/.lambda/config/genesis.json
```

### Add Seed Nodes

You'll need to add available seed nodes to `$HOME/.lambda/config/config.toml`.

```bash
vim ~/.lambda/config/config.toml
seeds = "dd3360f3a4334432af394a835662a2b21bf406e2@seednodes.oneweb.one:26656"
```

## Run a Full Node

Start the full node with this command:

```bash
./lambda start
```

## Export State

Lambda can dump the entire application state to a JSON file, which could be useful for manual analysis and can also be used as the genesis file of a new network.

Export state with:

```bash
./lambda export > [filename].json
```

You can also export state from a particular height (at the end of processing the block of that height):

```bash
./lambda export --height [height] > [filename].json
```

If you plan to start a new network from the exported state, export with the `--for-zero-height` flag:

```bash
./lambda export --height [height] --for-zero-height > [filename].json
```

## Become a Validator Node

Now you have an active full node. Then you can upgrade your node to a lambda validator and have possibility(depends on your stakes) to paticipate lambda consensus network and get rewarded by performance

### Create Your Validator

Your `lambdavalconspub` can be used to create a new validator by staking tokens. You can find your validator pubkey by running:

```bash
./lambda tendermint show-validator

To create the validator, just use the following command:

```bash
./lambda tx staking create-validator \
  --amount=1999999998000ulamb|666666666utbb \
  --pubkey=$(./lambda tendermint show-validator) \
  --moniker="choose a moniker" \
  --gas-prices="0.25ulamb" \
  --from=<key_name>
```

**tips**
You can edit validator settings by using lambdacli. Please check [here](./lambdacli/tx/staking/edit-validator.md) to looking for details.

Currently `commission-rate` and ` --commission-max-rate` is 25% by default and change commission is not supported for current mainnet

### View Validator Description

View the validator's information with this command:

```bash
./lambdacli query staking validator <account>
```

### Confirm Your Validator is Running

Your validator is active if the following command returns anything:

```bash
./lambdacli query tendermint-validator-set | grep "$(./lambda tendermint show-validator)"
```

if there is nothing returned, you probably need to `unjail` your validator. For more details, please
click [here](./lambdacli/tx/slashing/unjail.md)
