# Genesis File

Genesis file is a JSON file which defines the initial state of `Lambda Chain`. The state contains all the necessary information.

## Genesis Time and Chain_id 

The `genesis_time` is a `UTC` timestamps which specifies when the blockchain is ready to start. At this time, genesis validators are supposed to come online and start participating in the consensus process. The blockchain starts when more than 2/3rd of the genesis validators (weighted by voting power) are online. 

```json
"genesis_time": "2019-08-25T16:00:00.000000000Z",
```

The `chain_id` is a unique identifier for your chain. You can also modify this to your own testnet genesis and helps to distinguishing with other chains


```json
"chain_id": "lambda-chain-2.3",
```

## Consensus Parameters

Next, the genesis file defines consensus parameters which are related to the consensus layer in `Tendermint`

- `block`
    + `max_bytes`: Maximum number of bytes per block. 
    + `max_gas`: Gas limit per block. Each transaction included in the block will consume some gas. The total gas used by transactions included in a block cannot exceed this limit.
    + `time_iota_ms`: Tendermint block time. 
- `evidence`
    + `max_age`: An evidence is a proof that a validator signed two different blocks at the same height (and round). This is an explicitely malicious behaviour that is punished at the state-machine level. The `max_age` defines the maximum number of **blocks** after which an evidence is not valid anymore. 
- `validator`
    + `pub_key_types`: The types of pubkey (`ed25519`, `secp256k1`, ...) that are accepted for validators. Currently only `ed25519` is accepted.

```json
"consensus_params": {
    "block": {
      "max_bytes": "200000",
      "max_gas": "2000000",
      "time_iota_ms": "1000"
    },
    "evidence": {
      "max_age": "100000"
    },
    "validator": {
      "pub_key_types": [
        "ed25519"
      ]
    }
  }
```

## Application State

The application state defines the initial state of the state-machine. 

### Genesis Accounts

In this section, initial allocation of tokens is defined. You can either add accounts manually by directly editing the genesis file, or use the following command:

```bash
// Example: ./lambda add-genesis-account [name|address] 10000000000ulamb,10000000000utbb

./lambda add-genesis-account [address_or_key_name] [coin][,[coin]] [flags]
```

After this command ,you can look up `accounts` in `app_state` to check this added account

```json
"accounts": [
      {
        "address": "lambda1ppy8tn6y6gm64sg03rmdrpp6fk22fcquyyufq2",
        "coins": [
          {
            "denom": "ulamb",
            "amount": "6000000000000000"
          },
          {
            "denom": "utbb",
            "amount": "999000000001"
          }
        ],
        "sequence_number": "0",
        "account_number": "0",
        "original_vesting": null,
        "delegated_free": null,
        "delegated_vesting": null,
        "start_time": "0",
        "end_time": "0"
      }
]
```

Let us break down the parameters:

- `sequence_number`: This number is used to count the number of transactions sent by this account. It is incremented each time a transaction is included in a block, and used to prevent replay attacks. Initial value is `0`.
- `account_number`: Unique identifier for the account. It is generated the first time a transaction including this account is included in a block.
- `original_vesting`: Vesting is natively supported by `lambda`. You can define an amount of token owned by the account that needs to be vested for a period of time before they can be transferred. Default value is `null`.The vesting token will be released monthly linearly in `lambda-chain`
- `delegated_free`: Amount of delegated tokens that can be transferred after they've been vested. 
- `delegated_vesting`: Amount of delegated tokens that are still vesting.
- `start_time`: Block at which the vesting period starts. `0` most of the time in genesis.
- `end_time`: Block at which the vesting period ends. `0` if no vesting for this account.

### Bank 

The `bank` module handles tokens. The only parameter that needs to be defined in this section is wether `transfers` are enabled at genesis or not.

```json
"bank": {
      "send_enabled": true
    }
```

### Staking

The `staking` module contains two different proof-of-stake logics.

```json
"staking": {
      "origin_staking": {
        "pool": {
          "not_bonded_tokens": "10100000000",
          "bonded_tokens": "0"
        },
        "params": {
          "unbonding_time": "259200000000000",
          "max_validators": 100,
          "max_entries": 7,
          "bond_denom": "utbb"
        },
        "last_total_power": "0",
        "last_validator_powers": null,
        "validators": null,
        "delegations": null,
        "unbonding_delegations": null,
        "redelegations": null,
        "exported": false
      },
      "lambda_staking": {
        "params": {
          "supply_denom": "ulamb",
          "consensus_validator_min_self_delegation": "666666666",
          "partner_validator_min_self_delegation": "33333333",
          "consensus_validator_min_delegation": "1000000",
          "partner_validator_min_delegation": "100000",
          "consensus_validator_fixed_commission_rate": "0.250000000000000000",
          "partner_validator_fixed_commission_rate": "0.250000000000000000"
        },
        "supply_pool": {
          "not_bonded_tokens": "10000000000000000",
          "bonded_tokens": "0"
        },
        "last_partner_powers": null,
        "partners": null,
        "partner_delegations": null,
        "partner_unbonding_delegations": null,
        "partner_redelegations": null
      }
    }
```
**tips**
`lambda-chain` has two tokens. `utbb`(space token) is the only token that used to pledge. It can be treat as storage token. `ulamb` is the fluid token that affected by inflation, reward to all qualified paticipants and used as fees for all the transactions

- `origin_staking`: Cosmos-sdk staking informations
- `pool`
    + `not_bonded_tokens`: Defines the amount of tokens not bonded (i.e. delegated) in genesis. 
    + `bonded_tokens`: Amount of bonded tokens in genesis. 
- `params`
    + `unbonding_time`: Time in **nanosecond** it takes for tokens to complete unbonding. 
    + `max_validators`: Maximum number of active validators. 
    + `max_entries`: Maximum unbonding delegations and redelegations between a particular pair of delegator / validator.
    + `bond_denom`: Denomination of the staking token. `utbb` in `lambda-chain`
- `last_total_power`: Total amount of voting power. Generally `0` in genesis (except if genesis was generated using a previous state).
- `last_validator_powers`: Power of each validator in last known state. Generally `null` in genesis (except if genesis was generated using a previous state).
- `validators`: List of last known validators. Generally `null` in genesis (except if genesis was generated using a previous state).
- `delegations`: List of last known validator delegations. Generally `null` in genesis (except if genesis was generated using a previous state).
- `unbonding_delegations`: List of last known unbonding validator delegations. Generally `null` in genesis (except if genesis was generated using a previous state).
- `redelegations`: List of last known validator redelegations. Generally `null` in genesis (except if genesis was generated using a previous state).
- `exported`: Whether this genesis was generated using the export of a previous state.

- `lambda_staking`: Lambda staking informations
- `params`
    + `supply_denom`: Denomination of the supply token. `ulamb` in `lambda-chain`
    + `consensus_validator_min_self_delegation`: Minimun amount of bond denom needed to become a validator. 
    + `partner_validator_min_self_delegation`: Minimun amount of bond denom needed to become a partner. 
    + `consensus_validator_min_delegation`: Minimun amount of bond denom needed to pledge to a validator.
    + `partner_validator_min_delegation`: Minimun amount of bond denom needed to pledge to a partner.
- `supply_pool`
    + `not_bonded_tokens`: Defines the amount of fluid tokens not bonded (i.e. exchanged to `bond denom`) in genesis. 
    + `bonded_tokens`: Amount of bonded fluid tokens in genesis.
- `last_partner_powers`: Power of each partner in last known state. Generally `null` in genesis (except if genesis was generated using a previous state).
- `partners`: List of last partners. Generally `null` in genesis (except if genesis was generated using a previous state).
- `partner_delegations`: List of last known partner delegations. Generally `null` in genesis (except if genesis was generated using a previous state).
- `partner_unbonding_delegations`: List of last known unbonding partner delegations. Generally `null` in genesis (except if genesis was generated using a previous state).
- `partner_redelegations`: List of last known partner redelegations. Generally `null` in genesis (except if genesis was generated using a previous state).
### Mint

The `mint` module governs the logic of inflating the supply of token. 
```json
"mint": {
      "minter": {
        "inflation": "0.070000000000000000",
        "annual_provisions": "0.000000000000000000"
      },
      "params": {
        "mint_denom": "ulamb",
        "inflation_rate_change": "0.130000000000000000",
        "inflation_max": "0.200000000000000000",
        "inflation_min": "0.070000000000000000",
        "goal_bonded": "0.670000000000000000",
        "blocks_per_year": "6311520"
      }
    }
```

- `minter`
    + `inflation`: Initial yearly percentage of increase in the total supply of staking token, compounded weekly. A `0.070000000000000000` value means the target is `7%` yearly inflation, compounded weekly.
    + `annual_provisions`: Calculated each block. Initialize at `0.000000000000000000`.
- `params`
    + `mint_denom`: Denom of the staking token that is inflated.
    + `inflation_rate_change`: Max yearly change in inflation. 
    + `inflation_max`: Maximum level of inflation.
    + `inflation_min`: Minimum level of inflation.
    + `goal_bonded`: Percentage of the total supply that is targeted to be bonded. If the percentage of bonded staking tokens is below this target, the inflation increases (following `inflation_rate_change`) until it reaches `inflation_max`. If the percentage of bonded staking tokens is above this target, the inflation decreases (following `inflation_rate_change`) until it reaches `inflation_min`.
    + `blocks_per_year`: Estimation of the amount of blocks per year. Used to compute the block reward coming from inflated staking token (called block provisions). 

### Distribution

The `distribution` module handles the logic of distribution block provisions and fees to validators and delegators.

```json
    "distribution": {
      "fee_pool": {
        "community_pool": null
      },
      "community_tax": "0.020000000000000000",
      "base_proposer_reward": "0.010000000000000000",
      "bonus_proposer_reward": "0.040000000000000000",
      "withdraw_addr_enabled": false,
      "delegator_withdraw_infos": null,
      "previous_proposer": "",
      "outstanding_rewards": null,
      "validator_accumulated_commissions": null,
      "validator_historical_rewards": null,
      "validator_current_rewards": null,
      "delegator_starting_infos": null,
      "validator_slash_events": null
    }
```

- `fee_pool`
    + `community_pool`: The community pool is a pool of tokens that can be used to pay for bounties. It is allocated via governance proposals. Generally `null` in genesis.
- `community_tax`: The tax percentage on fees and block rewards that goes to the community pool.
- `base_proposer_reward`: Base bonus on transaction fees collected in a valid block that goes to the proposer of block. If value is `0.010000000000000000`, 1% of the fees go to the proposer. 
- `bonus_proposer_reward`: Max bonus on transaction fees collected in a valid block that goes to the proposer of block. The bonus depends on the number of `precommits` the proposer includes. If the proposer includes 2/3rd `precommits` weighted by voting power (minimum for the block to be valid), they get a bonus of `base_proposer_reward`. This bonus increases linearly up to `bonus_proposer_reward` if the proposer includes 100% of `precommits`.
- `withdraw_addr_enabled`: If `true`, delegators can set a different address to withdraw their rewards. Set to `false` if you want to disable transfers at genesis, as it can be used as a way to get around the restriction.
- `delegator_withdraw_infos`: List of delegators withdraw address. Generally `null` if genesis was not exported from previous state.
- `previous_proposer`: Proposer of the previous block. Set to `""` if genesis was not exported from previous state.
- `outstanding_rewards`: Outstanding (un-withdrawn) rewards. Set to `null` if genesis was not exported from previous state.
- `validator_accumulated_commission`: Outstanding (un-withdrawn) commission of validators. Set to `null` if genesis was not exported from previous state.
- `validator_historical_rewards`: Set of information related to the historical rewards of validators and used by the `distribution` module for various computation. Set to `null` if genesis was not exported from previous state. 
- `validators_current_rewards`: Set of information related to the current rewards of validators and used by the `distribution` module for various computation. Set to `null` if genesis was not exported from previous state.
- `delegator_starting_infos`: Tracks the previous validator period, the delegation's amount of staking token, and the creation height (to check later on if any slashes have occurred). Set to `null` if genesis was not exported from previous state.
- `validator_slash_events`: Set of information related to the past slashing of validators. Set to `null` if genesis was not exported from previous state.

### Governance

The `gov` module handles all governance-related transactions. 

```json
"gov": {
      "starting_proposal_id": "1",
      "deposits": null,
      "votes": null,
      "proposals": null,
      "deposit_params": {
        "min_deposit": [
          {
            "denom": "ulamb",
            "amount": "512000000"
          }
        ],
        "max_deposit_period": "1209600000000000"
      },
      "voting_params": {
        "voting_period": "1209600000000000"
      },
      "tally_params": {
        "quorum": "0.4",
        "threshold": "0.5",
        "veto": "0.334",
      }
    }
```

- `starting_proposal_id`: This parameter defines the ID of the first proposal. Each proposal is identified by a unique ID.
- `deposits`: List of deposits for each proposal ID. Set to `null` if genesis was not exported from previous state.
- `votes`: List of votes for each proposal ID. Set to `null` if genesis was not exported from previous state.
- `proposals`: List of proposals for each proposal ID: Set to `null` if genesis was not exported from previous state.
- `deposit_params`
    + `min_deposit`: The minimum deposit required for the proposal to enter `Voting Period`. If multiple denoms are provided, the `OR`  operator applies.
    + `max_deposit_period`: The maximum period (in **nanoseconds**) after which it is not possible to deposit on the proposal anymore.
- `voting_params`
    + `voting_period`: Length of the voting period in **nanoseconds**. 
- `tally_params`
    + `quorum`: Minimum percentage of bonded staking tokens that needs to vote for the result to be valid.
    + `threshold`: Minimum percentage of votes that need to be `YES` for the result to be valid.
    + `veto`: Maximum percentage `NO_WITH_VETO` votes for the result to be valid.

### Slashing 

The `slashing` module handles the logic to slash delegators if their validator misbehave. 

```json
"slashing": {
      "params": {
        "max_evidence_age": "1814400000000000",
        "signed_blocks_window": "10000",
        "min_signed_per_window": "0.050000000000000000",
        "downtime_jail_duration": "600000000000",
        "slash_fraction_double_sign": "0.050000000000000000",
        "slash_fraction_downtime": "0.000100000000000000"
      },
      "signing_infos": {},
      "missed_blocks": {}
    }
```

- `params`
    + `max_evidence_age`: Maximum age of the evidence in **nanoseconds**.
    + `signed_blocks_window`: Moving window of blocks to figure out offline validators.
    + `min_signed_per_window`: Minimum percentage of `precommits`that must be present in the `block window` for the validator to be considered online.
    + `downtime_jail_duration`: Duration in **nanoseconds** for which a validator is jailed after they get slashed for downtime.
    + `slash_fraction_double_sign`: Percentage of delegators bonded stake slashed when their validator double signs. 
    + `slash_fraction_downtime`: Percentage of delegators bonded stake slashed when their validator is down.
- `signing_infos`: Various infos per validator needed by the `slashing` module. Set to `{}` if genesis was not exported from previous state.
- `missed_blocks`: Various infos related to missed blocks needed by the `slashing` module. Set to `{}` if genesis was not exported from previous state.

### Asset 

The `asset` module handles the logic to exchange tokens to space token. 

```json
"asset": {
      "pool": {
        "bonded_coins": null
      },
      "params": {},
      "pledges": null,
      "asset_pairs": [
        {
          "asset": "utbb",
          "token": "ulamb",
          "droppable": true,
          "sendable": true,
          "exchange_ratio": "3000"
        }
      ]
    }
```

- `pool`:
    + `bonded_coins`: total amount of tokens and denominations pledged
- `params`: 
- `pledges`: All pledge infos for each account
- `asset_pairs`: List all exchangable asset and token paris
    + `asset`: Asset denomination
    + `token`: Available token denomination
    + `droppable`: Exchange back to token
    + `sendable`: Sendable
    + `exchange_ratio`: Exchange ratio from token to asset

### Genesis Transactions

By default, `gentxs` is empty and it can be collected by gentx command. The command creates the genesis validators signed by themselves

A `gentx` can be added manually to the genesis file, or via the following command:

```bash
./lambda collect-gentxs
```

