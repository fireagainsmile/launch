# lambdacli status

## Description

Query remote node for status

## Usage

```shell
lambdacli status <flags>
```

## Flags

| Name, shorthand       | Default               | Description                         | Required |
| --------------------- | --------------------- | ----------------------------------- | -------- |
| --help, -h            |                       | Help for status                     |          |
| --node, -n            | tcp://localhost:26657 |\<host>:\<port> to tendermint rpc interface for this chain |          |

## Examples

### Query remote node for status

```shell
lambdacli status --indent
```

After that, you can get remote node status as follows:

```json
{
  "node_info": {
    "protocol_version": {
      "p2p": "7",
      "block": "10",
      "app": "0"
    },
    "id": "025c888f12096fbb66cd28c1f3a6a9b07f20490a",
    "listen_addr": "tcp://0.0.0.0:26656",
    "network": "lambda-test",
    "version": "0.31.5",
    "channels": "4020212223303800",
    "moniker": "mtest",
    "other": {
      "tx_index": "on",
      "rpc_address": "tcp://0.0.0.0:26657"
    }
  },
  "sync_info": {
    "latest_block_hash": "F84C86DF2E4CAD962C210ECBA9562B28C9E5A8E7EF6ACD2948E97ECE0A5D6E8D",
    "latest_app_hash": "D4D1B283A25164FE7A5118A81E39879CE60527E3F3E6C97E2F199EF87D6B2F2D",
    "latest_block_height": "4700",
    "latest_block_time": "2019-08-21T02:45:19.07398Z",
    "catching_up": false
  },
  "validator_info": {
    "address": "723152C0423B2DB995E822AA59D00139AB4A2D68",
    "pub_key": {
      "type": "tendermint/PubKeyEd25519",
      "value": "Iy8aRcLzAoo+koPZGuT0bQshdWnnFY1Ef1jFqpVGc70="
    },
    "voting_power": "1000"
  }
}
```
