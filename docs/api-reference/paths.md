cli-Lite for Lambda
===================
A REST interface for state queries, transaction generation and broadcasting.

**Version:** 3.0

### /version
---
##### ***GET***
**Summary:** Version of cli-lite

**Description:** Get the version of cli-lite running locally to compare against expected

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Plaintext version i.e. "v0.25.0" |

### /node_version
---
##### ***GET***
**Summary:** Version of the connected node

**Description:** Get the version of the SDK running on the connected node to compare against expected

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Plaintext version i.e. "v0.25.0" |
| 500 | failed to query node version |

### /node_info
---
##### ***GET***
**Summary:** The properties of the connected node

**Description:** Information about the connected node

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Node status | object |
| 500 | Failed to query node status |  |

### /syncing
---
##### ***GET***
**Summary:** Syncing state of node

**Description:** Get if the node is currently syning with other nodes

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | "true" or "false" |
| 500 | Server internal error |

### /blocks/latest
---
##### ***GET***
**Summary:** Get the latest block

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | The latest block | [BlockQuery](#blockquery) |
| 500 | Server internal error |  |

### /blocks/{height}
---
##### ***GET***
**Summary:** Get a block at a certain height

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| height | path | Block height | Yes | number |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | The block at a specific height | [BlockQuery](#blockquery) |
| 400 | Invalid height |  |
| 404 | Request block height doesn't |  |
| 500 | Server internal error |  |

### /validatorsets/latest
---
##### ***GET***
**Summary:** Get the latest validator set

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | The validator set at the latest block height | object |
| 500 | Server internal error |  |

### /validatorsets/{height}
---
##### ***GET***
**Summary:** Get a validator set a certain height

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| height | path | Block height | Yes | number |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | The validator set at a specific block height | object |
| 400 | Invalid height |  |
| 404 | Block at height not available |  |
| 500 | Server internal error |  |

### /txs/{hash}
---
##### ***GET***
**Summary:** Get a Tx by hash

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| hash | path | Tx hash | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Tx with the provided hash | [TxQuery](#txquery) |
| 500 | Internal Server Error |  |

### /txs
---
##### ***GET***
**Summary:** Search transactions

**Description:** Search transactions by tag(s).

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| tag | query | transaction tags such as 'action=createMiner' and 'address=lambda10n28z3nw3n8uv6e04c5ttukq53sp2twdjsd6yh' which results in the following endpoint: 'GET /txs?action=createMiner&address=lambda10n28z3nw3n8uv6e04c5ttukq53sp2twdjsd6yh' | Yes | string |
| page | query | Page number | No | integer |
| limit | query | Maximum number of items per page | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | All txs matching the provided tags | [ [TxQuery](#txquery) ] |
| 400 | Invalid search tags |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Broadcast a signed tx

**Description:** Broadcast a signed tx to a full node

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| txBroadcast | body | The tx must be a signed StdTx. The supported broadcast modes include `"block"`(return after tx commit), `"sync"`(return afer CheckTx) and `"async"`(return right away). | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Tx broadcasting result | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 500 | Internal Server Error |  |

### /txs/encode
---
##### ***POST***
**Summary:** Encode a transaction to the Amino wire format

**Description:** Encode a transaction (signed or not) from JSON to base64-encoded Amino serialized bytes

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| tx | body | The tx to encode | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | The tx was successfully decoded and re-encoded | object |
| 400 | The tx was malformated |  |
| 500 | Server internal error |  |

### /bank/balances/{address}
---
##### ***GET***
**Summary:** Get the account balances

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | Account address in bech32 format | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Account balances | [ [Coin](#coin) ] |
| 204 | There is no data for the requested account |  |
| 500 | Server internal error |  |

### /bank/accounts/{address}/transfers
---
##### ***POST***
**Summary:** Send coins from one account to another

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | Account address in bech32 format | Yes | string |
| account | body | The sender and tx information | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 202 | Tx was succesfully generated | [StdTx](#stdtx) |
| 400 | Invalid request |  |
| 500 | Server internal error |  |

### /auth/accounts/{address}
---
##### ***GET***
**Summary:** Get the account information on blockchain

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | Account address | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Account information on the blockchain | object |
| 204 | No content about this account address |  |
| 500 | Server internel error |  |

### /staking/delegators/{delegatorAddr}/delegations
---
##### ***GET***
**Summary:** Get all delegations from a delegator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Delegation](#delegation) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Submit delegation

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| delegation | body | The password of the account to remove from the KMS | No | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid delegator address or delegation request body |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/delegations/{validatorAddr}
---
##### ***GET***
**Summary:** Query the current delegation between a delegator and a validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Delegation](#delegation) |
| 400 | Invalid delegator address or validator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/unbonding_delegations
---
##### ***GET***
**Summary:** Get all unbonding delegations from a delegator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [UnbondingDelegation](#unbondingdelegation) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Submit an unbonding delegation

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| delegation | body | The password of the account to remove from the KMS | No | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid delegator address or unbonding delegation request body |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/unbonding_delegations/{validatorAddr}
---
##### ***GET***
**Summary:** Query all unbonding delegations between a delegator and a validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [UnbondingDelegation](#unbondingdelegation) ] |
| 400 | Invalid delegator address or validator address |  |
| 500 | Internal Server Error |  |

### /staking/redelegations
---
##### ***GET***
**Summary:** Get all redelegations (filter by query params)

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegator | query | Bech32 AccAddress of Delegator | No | string |
| validator_from | query | Bech32 ValAddress of SrcValidator | No | string |
| validator_to | query | Bech32 ValAddress of DstValidator | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Redelegation](#redelegation) ] |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/redelegations
---
##### ***POST***
**Summary:** Submit a redelegation

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| delegation | body | The sender and tx information | No | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Tx was succesfully generated | [StdTx](#stdtx) |
| 400 | Invalid delegator address or redelegation request body |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/validators
---
##### ***GET***
**Summary:** Query all validators that a delegator is bonded to

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Validator](#validator) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/validators/{validatorAddr}
---
##### ***GET***
**Summary:** Query a validator that a delegator is bonded to

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 ValAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Validator](#validator) |
| 400 | Invalid delegator address or validator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/txs
---
##### ***GET***
**Summary:** Get all staking txs (i.e msgs) from a delegator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [TxQuery](#txquery) ] |
| 204 | No staking transaction about this delegator address |  |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

### /staking/validators
---
##### ***GET***
**Summary:** Get all validator candidates. By default it returns only the bonded validators.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| status | query | The validator bond status. Must be either 'bonded', 'unbonded', or 'unbonding'. | No | string |
| page | query | The page number. | No | integer |
| limit | query | The maximum number of items per page. | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Validator](#validator) ] |
| 500 | Internal Server Error |  |

### /staking/validators/{validatorAddr}
---
##### ***GET***
**Summary:** Query the information from a single validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Validator](#validator) |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /staking/validators/{validatorAddr}/delegations
---
##### ***GET***
**Summary:** Get all delegations from a validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Delegation](#delegation) ] |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /staking/validators/{validatorAddr}/unbonding_delegations
---
##### ***GET***
**Summary:** Get all unbonding delegations from a validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [UnbondingDelegation](#unbondingdelegation) ] |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /staking/pool
---
##### ***GET***
**Summary:** Get the current state of the staking pool

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | object |
| 500 | Internal Server Error |  |

### /staking/parameters
---
##### ***GET***
**Summary:** Get the current staking parameter values

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | object |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/partner_delegations
---
##### ***GET***
**Summary:** Get all partner delegations from a delegator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Delegation](#delegation) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

### /staking/partner_validators
---
##### ***GET***
**Summary:** Get all partner validator candidates. By default it returns only the bonded validators.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| status | query | The validator bond status. Must be either 'bonded', 'unbonded', or 'unbonding'. | No | string |
| page | query | The page number. | No | integer |
| limit | query | The maximum number of items per page. | No | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Validator](#validator) ] |
| 500 | Internal Server Error |  |

### /staking/partner_validators/{validatorAddr}
---
##### ***GET***
**Summary:** Get a single partner validator info

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Validator](#validator) |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /staking/partner_validators/{validatorAddr}/delegations
---
##### ***GET***
**Summary:** Get all delegations to a partner validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Delegation](#delegation) ] |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /staking/partner_validators/{validatorAddr}/unbonding_delegations
---
##### ***GET***
**Summary:** Get all unbonding delegations from a partner validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [UnbondingDelegation](#unbondingdelegation) ] |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/partner_validators
---
##### ***GET***
**Summary:** Query all partner validators that a delegator is bonded to

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Validator](#validator) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/partner_validators/{validatorAddr}
---
##### ***GET***
**Summary:** Query a partner validator that a delegator is bonded to

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 ValAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Validator](#validator) |
| 400 | Invalid delegator address or validator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/partner_delegations/{validatorAddr}
---
##### ***GET***
**Summary:** Query a delegation between a delegator and a partner validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Delegation](#delegation) |
| 400 | Invalid delegator address or validator address |  |
| 500 | Internal Server Error |  |

### /staking/delegators/{delegatorAddr}/unbonding_partner_delegations/{validatorAddr}
---
##### ***GET***
**Summary:** Query all unbonding delegations between a delegator and a partner validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [UnbondingDelegation](#unbondingdelegation) ] |
| 400 | Invalid delegator address or validator address |  |
| 500 | Internal Server Error |  |

### /staking/supply_pool
---
##### ***GET***
**Summary:** Get the current state of the supply pool

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | object |
| 500 | Internal Server Error |  |

### /slashing/validators/{validatorPubKey}/signing_info
---
##### ***GET***
**Summary:** Get sign info of given validator

**Description:** Get sign info of given validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorPubKey | path | Bech32 validator public key | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [SigningInfo](#signinginfo) |
| 204 | No sign info of this validator |  |
| 400 | Invalid validator public key |  |
| 500 | Internal Server Error |  |

### /slashing/signing_infos
---
##### ***GET***
**Summary:** Get sign info of given all validators

**Description:** Get sign info of all validators

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| page | query | Page number | Yes | integer |
| limit | query | Maximum number of items per page | Yes | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [SigningInfo](#signinginfo) ] |
| 204 | No validators with sign info |  |
| 400 | Invalid validator public key for one of the validators |  |
| 500 | Internal Server Error |  |

### /slashing/validators/{validatorAddr}/unjail
---
##### ***POST***
**Summary:** Unjail a jailed validator

**Description:** Send transaction to unjail a jailed validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 validator address | Yes | string |
| UnjailBody | body |  | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Tx was succesfully generated | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid validator address or base_req |  |
| 500 | Internal Server Error |  |

### /slashing/parameters
---
##### ***GET***
**Summary:** Get the current slashing parameters

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | object |
| 500 | Internal Server Error |  |

### /gov/proposals
---
##### ***POST***
**Summary:** Submit a proposal

**Description:** Send transaction to submit a proposal

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| post_proposal_body | body | valid value of `"proposal_type"` can be `"text"`, `"parameter_change"`, `"software_upgrade"` | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Tx was succesfully generated | [StdTx](#stdtx) |
| 400 | Invalid proposal body |  |
| 500 | Internal Server Error |  |

##### ***GET***
**Summary:** Query proposals

**Description:** Query proposals information with parameters

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| voter | query | voter address | No | string |
| depositor | query | depositor address | No | string |
| proposal_status | query | proposal status, valid values can be `"deposit_period"`, `"voting_period"`, `"passed"`, `"rejected"` | No | string |
| limit | query | query result count | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [TextProposal](#textproposal) ] |
| 400 | Invalid query parameters |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}
---
##### ***GET***
**Summary:** Query a proposal

**Description:** Query a proposal by id

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path |  | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TextProposal](#textproposal) |
| 400 | Invalid proposal id |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}/proposer
---
##### ***GET***
**Summary:** Query proposer

**Description:** Query for the proposer for a proposal

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path |  | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Proposer](#proposer) |
| 400 | Invalid proposal ID |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}/deposits
---
##### ***GET***
**Summary:** Query deposits

**Description:** Query deposits by proposalId

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path |  | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Deposit](#deposit) ] |
| 400 | Invalid proposal id |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Deposit tokens to a proposal

**Description:** Send transaction to deposit tokens to a proposal

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path | proposal id | Yes | string |
| post_deposit_body | body |  | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid proposal id or deposit body |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}/deposits/{depositor}
---
##### ***GET***
**Summary:** Query deposit

**Description:** Query deposit by proposalId and depositor address

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path | proposal id | Yes | string |
| depositor | path | Bech32 depositor address | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Deposit](#deposit) |
| 400 | Invalid proposal id or depositor address |  |
| 404 | Found no deposit |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}/votes
---
##### ***GET***
**Summary:** Query voters

**Description:** Query voters information by proposalId

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path | proposal id | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Vote](#vote) ] |
| 400 | Invalid proposal id |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Vote a proposal

**Description:** Send transaction to vote a proposal

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path | proposal id | Yes | string |
| post_vote_body | body | valid value of `"option"` field can be `"yes"`, `"no"`, `"no_with_veto"` and `"abstain"` | Yes | object |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid proposal id or vote body |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}/votes/{voter}
---
##### ***GET***
**Summary:** Query vote

**Description:** Query vote information by proposal Id and voter address

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path | proposal id | Yes | string |
| voter | path | Bech32 voter address | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Vote](#vote) |
| 400 | Invalid proposal id or voter address |  |
| 404 | Found no vote |  |
| 500 | Internal Server Error |  |

### /gov/proposals/{proposalId}/tally
---
##### ***GET***
**Summary:** Get a proposal's tally result at the current time

**Description:** Gets a proposal's tally result at the current time. If the proposal is pending deposits (i.e status 'DepositPeriod') it returns an empty tally result.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| proposalId | path | proposal id | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [TallyResult](#tallyresult) |
| 400 | Invalid proposal id |  |
| 500 | Internal Server Error |  |

### /gov/parameters/deposit
---
##### ***GET***
**Summary:** Query governance deposit parameters

**Description:** Query governance deposit parameters. The max_deposit_period units are in nanoseconds.

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | object |
| 400 | <other_path> is not a valid query request path |  |
| 404 | Found no deposit parameters |  |
| 500 | Internal Server Error |  |

### /gov/parameters/tallying
---
##### ***GET***
**Summary:** Query governance tally parameters

**Description:** Query governance tally parameters

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK |  |
| 400 | <other_path> is not a valid query request path |  |
| 404 | Found no tally parameters |  |
| 500 | Internal Server Error |  |

### /gov/parameters/voting
---
##### ***GET***
**Summary:** Query governance voting parameters

**Description:** Query governance voting parameters. The voting_period units are in nanoseconds.

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK |  |
| 400 | <other_path> is not a valid query request path |  |
| 404 | Found no voting parameters |  |
| 500 | Internal Server Error |  |

### /distribution/delegators/{delegatorAddr}/rewards
---
##### ***GET***
**Summary:** Get the total rewards balance from all delegations

**Description:** Get the sum of all the rewards earned by delegations by a single delegator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Coin](#coin) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Withdraw all the delegator's delegation rewards

**Description:** Withdraw all the delegator's delegation rewards

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| Withdraw request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid delegator address |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /distribution/delegators/{delegatorAddr}/rewards/{validatorAddr}
---
##### ***GET***
**Summary:** Query a delegation reward

**Description:** Query a single delegation reward by a delegator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Coin](#coin) ] |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Withdraw a delegation reward

**Description:** Withdraw a delegator's delegation reward from a single validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |
| Withdraw request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid delegator address or delegation body |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /distribution/delegators/{delegatorAddr}/withdraw_address
---
##### ***GET***
**Summary:** Get the rewards withdrawal address

**Description:** Get the delegations' rewards withdrawal address. This is the address in which the user will receive the reward funds

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Address](#address) |
| 400 | Invalid delegator address |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Replace the rewards withdrawal address

**Description:** Replace the delegations' rewards withdrawal address for a new one.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| delegatorAddr | path | Bech32 AccAddress of Delegator | Yes | string |
| Withdraw request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid delegator or withdraw address |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /distribution/validators/{validatorAddr}
---
##### ***GET***
**Summary:** Validator distribution information

**Description:** Query the distribution information of a single validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ValidatorDistInfo](#validatordistinfo) |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

### /distribution/validators/{validatorAddr}/outstanding_rewards
---
##### ***GET***
**Summary:** Fee distribution outstanding rewards of a single validator

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Coin](#coin) ] |
| 500 | Internal Server Error |  |

### /distribution/validators/{validatorAddr}/rewards
---
##### ***GET***
**Summary:** Commission and self-delegation rewards of a single validator

**Description:** Query the commission and self-delegation rewards of validator.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Coin](#coin) ] |
| 400 | Invalid validator address |  |
| 500 | Internal Server Error |  |

##### ***POST***
**Summary:** Withdraw the validator's rewards

**Description:** Withdraw the validator's self-delegation and commissions rewards

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| validatorAddr | path | Bech32 OperatorAddress of validator | Yes | string |
| Withdraw request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid validator address |  |
| 401 | Key password is wrong |  |
| 500 | Internal Server Error |  |

### /distribution/community_pool
---
##### ***GET***
**Summary:** Community pool parameters

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Coin](#coin) ] |
| 500 | Internal Server Error |  |

### /distribution/parameters
---
##### ***GET***
**Summary:** Fee distribution parameters

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK |  |
| 500 | Internal Server Error |  |

### /minting/parameters
---
##### ***GET***
**Summary:** Minting module parameters

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK |  |
| 500 | Internal Server Error |  |

### /minting/inflation
---
##### ***GET***
**Summary:** Current minting inflation value

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | string |
| 500 | Internal Server Error |  |

### /minting/annual-provisions
---
##### ***GET***
**Summary:** Current minting annual provisions value

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | string |
| 500 | Internal Server Error |  |

### /asset/pledge/{address}
---
##### ***GET***
**Summary:** Get the account's pledges

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | Bech32 AccAddress | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Pledge](#pledge) ] |
| 500 | Internal Server Error |  |

### /asset/pool
---
##### ***GET***
**Summary:** Get asset pool

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Pool](#pool) |
| 500 | Internal Server Error |  |

### /asset/parameters
---
##### ***GET***
**Summary:** Get asset module parameters

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [AssetParams](#assetparams) |
| 500 | Internal Server Error |  |

### /asset/pairs/{asset}
---
##### ***GET***
**Summary:** Get exchange pairs by the given asset

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| asset | path | asset name | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Pair](#pair) ] |
| 500 | Internal Server Error |  |

### /asset/pledge
---
##### ***POST***
**Summary:** Pledge token to get asset

**Description:** Pledge token to get asset

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Pledge asset request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid address or Invalid asset amount or Invalid token amount |  |
| 500 | Internal Server Error |  |

### /asset/drop
---
##### ***POST***
**Summary:** Drop asset to get token

**Description:** Drop asset to get token

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Drop asset request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid address or Invalid asset amount or Invalid token amount |  |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### /asset/lock
---
##### ***POST***
**Summary:** Lock asset

**Description:** Lock asset

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Lock asset request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid address or Invalid asset amount or Invalid token amount |  |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### asset/unLock
---
##### ***POST***
**Summary:** unLock asset

**Description:** unLock asset

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| unLock asset request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid address or Invalid asset amount or Invalid token amount |  |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### asset/destroy
---
##### ***POST***
**Summary:** Destroy asset

**Description:** Destroy asset

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Destroy asset request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid address or Invalid asset amount or Invalid token amount |  |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### /asset/lock/{address}
---
##### ***GET***
**Summary:** Get Address lock all asset info

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | Bech32 address | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK |  |
| 500 | Internal Server Error |  |

### /asset/symbol/{symbol}
---
##### ***GET***
**Summary:** Get asset info

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| symbol | path | asset symbol name | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | object |
| 500 | Internal Server Error |  |

### /asset/all
---
##### ***GET***
**Summary:** Get all asset info

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ object ] |
| 500 | Internal Server Error |  |

### /market/create-sellorder
---
##### ***POST***
**Summary:** Create a sell order in market

**Description:** Create a sell order in market

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Create sell order request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid name or Invalid order price or Invalid order rate |  |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### /market/create-buyorder
---
##### ***POST***
**Summary:** Create a buy order in market

**Description:** Create a buy order in market

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Create buy order request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 400 | Invalid name or Invalid order buy duration or Invalid order buy size |  |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### /market/create-miner
---
##### ***POST***
**Summary:** Create a miner actor

**Description:** Create a miner actor

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Create miner request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### /market/edit-miner
---
##### ***POST***
**Summary:** Edit miner

**Description:** Edit miner DhtId or MiningAddress

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Edit miner request body | body |  | No |  |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [BroadcastTxCommitResult](#broadcasttxcommitresult) |
| 401 | Must use own asset address |  |
| 500 | Internal Server Error |  |

### /market/markets
---
##### ***GET***
**Summary:** Get all markets

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Market](#market) ] |
| 500 | Internal Server Error |  |

### /market/sellorders/{marketName}/{orderType}/{status}/{page}/{limit}
---
##### ***GET***
**Summary:** Get sell orders in market by name

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| marketName | path | Market Name | Yes | string |
| orderType | path | Order Type | Yes | string |
| status | path | Order Status | Yes | string |
| page | path | Query count start page | Yes | string |
| limit | path | Query count limit | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [SellOrder](#sellorder) ] |
| 500 | Internal Server Error |  |

### /market/miner/sellorders/{address}/{page}/{limit}
---
##### ***GET***
**Summary:** Get sell orders under the address

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | bech32 encoded address | Yes | string |
| page | path | Query count start page | Yes | string |
| limit | path | Query count limit | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [SellOrder](#sellorder) ] |
| 500 | Internal Server Error |  |

### /market/miner/minerinfo/{address}
---
##### ***GET***
**Summary:** Get miner info by address

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | bech32 encoded address | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Miner](#miner) |
| 500 | Internal Server Error |  |

### /market/matchorders/{address}/{page}/{limit}
---
##### ***GET***
**Summary:** Get match orders under the address

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | bech32 encoded address | Yes | string |
| page | path | Query count start page | Yes | string |
| limit | path | Query count limit | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [MatchOrder](#matchorder) ] |
| 500 | Internal Server Error |  |

### /market/user/matchorders/{address}
---
##### ***GET***
**Summary:** Get match orders by address

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| address | path | bech32 encoded address | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [MatchOrder](#matchorder) ] |
| 500 | Internal Server Error |  |

### /market/matchorder/{orderId}
---
##### ***GET***
**Summary:** Get match order info by ID

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| orderId | path | order ID | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [MatchOrder](#matchorder) |
| 500 | Internal Server Error |  |

### /market/params
---
##### ***GET***
**Summary:** Get market config params

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [Params](#params) |
| 500 | Internal Server Error |  |

### Models
---

### CheckTxResult  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | string |  |  |
| gas_used | integer |  |  |
| gas_wanted | integer |  |  |
| info | string |  |  |
| log | string |  |  |
| tags | [ [KVPair](#kvpair) ] |  |  |

### DeliverTxResult  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| code | integer |  |  |
| data | string |  |  |
| gas_used | integer |  |  |
| gas_wanted | integer |  |  |
| info | string |  |  |
| log | string |  |  |
| tags | [ [KVPair](#kvpair) ] |  |  |

### BroadcastTxCommitResult  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| check_tx | [CheckTxResult](#checktxresult) |  |  |
| deliver_tx | [DeliverTxResult](#delivertxresult) |  |  |
| hash | [Hash](#hash) |  |  |
| height | integer |  |  |

### KVPair  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| key | string |  |  |
| value | string |  |  |

### Msg  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| Msg | string |  |  |

### Address  

bech32 encoded address

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| Address | string | bech32 encoded address | lambda10n28z3nw3n8uv6e04c5ttukq53sp2twdjsd6yh |

### ValidatorAddress  

bech32 encoded address

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| ValidatorAddress | string | bech32 encoded address | lambdavaloper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fvjhnk3 |

### MarketAddress  

bech32 encoded address

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| MarketAddress | string | bech32 encoded address | lambdamarketoper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fn26xmc |

### MinerAddress  

bech32 encoded address

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| MinerAddress | string | bech32 encoded address | lambdamineroper1v7rq4afpf47wfq4qymyaa9mvvvq69f7fwejlec |

### Coin  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| denom | string |  | lamb |
| amount | string |  | 50 |

### Hash  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| Hash | string |  | EE5F3404034C524501629B56E0DDC38FAD651F04 |

### TxQuery  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| hash | string |  |  |
| height | number |  |  |
| tx | [StdTx](#stdtx) |  |  |
| result | object |  |  |

### StdTx  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| msg | [ [Msg](#msg) ] |  |  |
| fee | object |  |  |
| memo | string |  |  |
| signature | object |  |  |

### KeyOutput  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| name | string |  | Main Account |
| address | string |  | lambda10n28z3nw3n8uv6e04c5ttukq53sp2twdjsd6yh |
| pub_key | string |  | lambdapub1addwnpepqd0e5r39n05zdkdg7w6fajmnlpkut9x8dxw0ycwz30fpyfnmz4097pcu7rm |
| type | string |  | local |
| seed | string |  |  |

### BlockID  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| hash | [Hash](#hash) |  |  |
| parts | object |  |  |

### BlockHeader  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| chain_id | string |  | gaia-2 |
| height | number |  | 1 |
| time | string |  | 2017-12-30T05:53:09.287+01:00 |
| num_txs | number |  | 0 |
| last_block_id | [BlockID](#blockid) |  |  |
| total_txs | number |  | 35 |
| last_commit_hash | [Hash](#hash) |  |  |
| data_hash | [Hash](#hash) |  |  |
| validators_hash | [Hash](#hash) |  |  |
| next_validators_hash | [Hash](#hash) |  |  |
| consensus_hash | [Hash](#hash) |  |  |
| app_hash | [Hash](#hash) |  |  |
| last_results_hash | [Hash](#hash) |  |  |
| evidence_hash | [Hash](#hash) |  |  |
| proposer_address | [Address](#address) |  |  |
| version | object |  |  |

### Block  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| header | [BlockHeader](#blockheader) |  |  |
| txs | [ string ] |  |  |
| evidence | [ string ] |  |  |
| last_commit | object |  |  |

### BlockQuery  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| block_meta | object |  |  |
| block | [Block](#block) |  |  |

### BaseReq  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| from | string | Sender address or Keybase name to generate a transaction | lambda10n28z3nw3n8uv6e04c5ttukq53sp2twdjsd6yh |
| memo | string |  | test lambda |
| chain_id | string |  | lambda-Hub |
| account_number | string |  | 0 |
| sequence | string |  | 1 |
| gas | string |  | 200000 |
| gas_adjustment | string |  | 1.2 |
| fees | [ [Coin](#coin) ] |  |  |
| simulate | boolean | Estimate gas for a transaction (cannot be used in conjunction with generate_only) | false |

### TendermintValidator  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| address | [ValidatorAddress](#validatoraddress) |  |  |
| pub_key | string |  | lambdavalconspub1addwnpepqd0e5r39n05zdkdg7w6fajmnlpkut9x8dxw0ycwz30fpyfnmz4097td6yg0 |
| voting_power | string |  | 1000 |
| proposer_priority | string |  | 1000 |

### TextProposal  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| proposal_id | integer |  |  |
| title | string |  |  |
| description | string |  |  |
| proposal_type | string |  |  |
| proposal_status | string |  |  |
| final_tally_result | [TallyResult](#tallyresult) |  |  |
| submit_time | string |  |  |
| total_deposit | [ [Coin](#coin) ] |  |  |
| voting_start_time | string |  |  |

### Proposer  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| proposal_id | integer |  |  |
| proposer | string |  |  |

### Deposit  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| amount | [ [Coin](#coin) ] |  |  |
| proposal_id | integer |  |  |
| depositor | [Address](#address) |  |  |

### TallyResult  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| yes | string |  | 0.0000000000 |
| abstain | string |  | 0.0000000000 |
| no | string |  | 0.0000000000 |
| no_with_veto | string |  | 0.0000000000 |

### Vote  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| voter | string |  |  |
| proposal_id | integer |  |  |
| option | string |  |  |

### Validator  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| operator_address | [ValidatorAddress](#validatoraddress) |  |  |
| consensus_pubkey | string |  | lambdavalconspub1addwnpepqd0e5r39n05zdkdg7w6fajmnlpkut9x8dxw0ycwz30fpyfnmz4097td6yg0 |
| jailed | boolean |  |  |
| status | integer |  |  |
| tokens | string |  |  |
| delegator_shares | string |  |  |
| description | object |  |  |
| bond_height | string |  | 0 |
| bond_intra_tx_counter | integer |  | 0 |
| unbonding_height | string |  | 0 |
| unbonding_time | string |  | 1970-01-01T00:00:00Z |
| commission | object |  |  |

### Delegation  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| delegator_address | string |  |  |
| validator_address | string |  |  |
| shares | string |  |  |

### UnbondingDelegation  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| delegator_address | string |  |  |
| validator_address | string |  |  |
| initial_balance | string |  |  |
| balance | string |  |  |
| creation_height | integer |  |  |
| min_time | integer |  |  |

### Redelegation  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| delegator_address | string |  |  |
| validator_src_address | string |  |  |
| validator_dst_address | string |  |  |
| creation_height | integer |  |  |
| min_time | integer |  |  |
| initial_balance | string |  |  |
| balance | string |  |  |
| shares_src | string |  |  |
| shares_dst | string |  |  |

### ValidatorDistInfo  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| operator_address | [ValidatorAddress](#validatoraddress) |  |  |
| self_bond_rewards | [ [Coin](#coin) ] |  |  |
| val_commission | [ [Coin](#coin) ] |  |  |

### SigningInfo  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| start_height | string |  |  |
| index_offset | string |  |  |
| jailed_until | string |  |  |
| missed_blocks_counter | string |  |  |

### Pledge  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| address | [Address](#address) |  |  |
| asset | [Coin](#coin) |  |  |
| token | [Coin](#coin) |  |  |

### Pool  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| bonded_coins | [ [Coin](#coin) ] |  |  |

### LockAsset  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| address | [Address](#address) |  |  |
| asset | [Coin](#coin) |  |  |
| lock_time | string |  |  |

### MarketInCome  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| feeInCome | [ [Coin](#coin) ] |  |  |
| commissionInCome | [ [Coin](#coin) ] |  |  |

### Market  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| marketAddress | [MarketAddress](#marketaddress) |  |  |
| name | string |  |  |
| owner | [Address](#address) |  |  |
| profit | [Address](#address) |  |  |
| feeRate | string |  |  |
| commissionRate | string |  |  |
| inCome | [MarketInCome](#marketincome) |  |  |
| payMent | [ [Coin](#coin) ] |  |  |

### SellOrder  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| orderId | string |  |  |
| address | [MinerAddress](#mineraddress) |  |  |
| price | string |  |  |
| rate | string |  |  |
| amount | [ [Coin](#coin) ] |  |  |
| sellSize | string |  |  |
| unUseSize | string |  |  |
| status | string |  |  |
| createTime | string |  |  |
| cancelTimeDuration | string |  |  |
| marketAddress | [MarketAddress](#marketaddress) |  |  |
| minBuySize | string |  |  |
| minDuration | string |  |  |
| maxDuration | string |  |  |

### Miner  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| address | [MinerAddress](#mineraddress) |  |  |
| status | integer |  |  |
| allSize | string |  |  |
| useSize | string |  |  |
| matchSize | string |  |  |
| dhtId | string |  |  |
| peerId | string |  |  |
| orderPledge | [Coin](#coin) |  |  |
| orderReward | [Coin](#coin) |  |  |
| lastWithDrawTime | string |  |  |
| miningAddress | [Address](#address) |  |  |
| missedPdpChallenge | integer |  |  |

### MatchOrder  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| orderId | string |  |  |
| askAddress | [MinerAddress](#mineraddress) |  |  |
| buyAddress | [Address](#address) |  |  |
| sellOrderId | string |  |  |
| buyOrderId | string |  |  |
| price | string |  |  |
| size | string |  |  |
| createTime | string |  |  |
| endTime | string |  |  |
| cancelTimeDuration | string |  |  |
| withDrawTime | string |  |  |
| status | integer |  |  |
| userPay | [Coin](#coin) |  |  |
| minerPay | [Coin](#coin) |  |  |
| peerId | string |  |  |
| dhtId | string |  |  |

### Params  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| market_min_rate | string |  |  |
| market_max_rate | string |  |  |
| market_min_price | string |  |  |
| order_normal_price | string |  |  |
| order_normal_rate | string |  |  |
| order_premium_rate | string |  |  |
| order_cancel_time_duration | string |  |  |
| order_min_buy_size | string |  |  |
| order_min_buy_duration | string |  |  |
| order_max_buy_duration | string |  |  |
| order_with_draw_min_duration | string |  |  |
| price_unit_set | [ string ] |  |  |
| size_unit_set | [ string ] |  |  |
| duration_unit_set | [ string ] |  |  |
| sell_order_buy_self | boolean |  |  |
| max_current_maintainer | integer |  |  |
| max_miner_maintain_time | string |  |  |
| window_duration | string |  |  |
| miner_unjail_cost | string |  |  |
| miner_unjail_rate | string |  |  |

### Pair  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| Pair |  |  |  |

### AssetParams  

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| AssetParams |  |  |  |