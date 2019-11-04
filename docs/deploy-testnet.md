# Deploy Your Own Lambda Testnet

The document shows how to deploy your own lambda testnet

**tips** make sure you have installed or downloaded latest version of `lambda` successfully, if not please check [here](./installation.md)

## Single-node

```bash

# Initialize the genesis.json file that will help you to bootstrap the network
./lambda init [moniker] --chain-id=[personal-chain-id]

# Create a key to hold your validator account
./lambdacli keys add master

# Add that key into the genesis.app_state.accounts array in the genesis file
# At least 666666666utbb to become a valid validator
# Make sure to add sufficient ulamb token to ensure inflating ulamb
./lambda add-genesis-account $(./lambdacli keys show master -a) 666666666utbb,1000000000000ulamb

# Generate the transaction that creates your validator
./lambda gentx --name master

# Add the generated bonding transaction to the genesis file
./lambda collect-gentxs

# Now its safe to start `lambda`
# Important optional flags
# --minimum-gas-prices Minimum gas prices to accept for transactions
# --p2p.laddr Node listen address (default "tcp://0.0.0.0:26656")
# --rpc.laddr RPC listen address (default "tcp://0.0.0.0:26657")
./lambda start

```

## Multi-node

Prepare two nodes, we name the first one as Node A, the second one as Node B

```bash

# Initialize the genesis.json file that will help you to bootstrap the network
#Node A
./lambdacli init [moniker] --chain-id=[personal-chain-id]

#Node B
./lambdacli init [moniker]

# Create a key to hold your validator account
#Node A
./lambdacli keys add nodeA
./lambdacli keys add nodeB

# Add that key into the genesis.app_state.accounts array in the genesis file
# At least 666666666utbb to become a valid validator
# Make sure to add sufficient ulamb token to ensure inflating ulamb
#Node A
./lambda add-genesis-account $(./lambdacli keys show nodeA -a) 666666666utbb,1000000000000ulamb
./lambda add-genesis-account $(./lambdacli keys show nodeB -a) 666666666utbb,1000000000000ulamb

# Generate the transaction that creates your validator
#Node A
./lambda gentx --name nodeA

#Node B
./lambda tendermint show-validator
>>[Node B consPubkey]

#Node A
./lambda gentx --name nodeB --pubkey [Node B consPubkey] --output-document ~/.lambda/config/gentx/gentx-nodeB.json

# Add the generated bonding transaction to the genesis file
#Node A
./lambda collect-gentxs
./lambda tendermint show-node-id
>>[Node A Node ID]

#configurate Node B
#copy genesis.json from nodeA to node B
#Set config.toml seeds to tcp://[Node A Node ID]@[Node A IP]:26656

# Now its safe to start `lambda`
# Important optional flags
# --minimum-gas-prices Minimum gas prices to accept for transactions
# --p2p.laddr Node listen address (default "tcp://0.0.0.0:26656")
# --rpc.laddr RPC listen address (default "tcp://0.0.0.0:26657")
#Node A
./lambda start

#Node B
./lambda start

```
