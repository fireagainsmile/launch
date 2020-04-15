# lambdacli query tendermint-validator-set

## Introduction

Get the full tendermint validator set at given height

## Usage

```
lambdacli query tendermint-validator-set [height] [flags]
```

Print query tendermint-validator-set flags:
```
lambdacli query tendermint-validator-set --help
```

## Examples
```
./lambdacli query tendermint-validator-set 1
```

output

```json
{
  "block_height": "1",
  "validators": [
    {
      "address": "lambdavalcons1pq2t69fmvtmqj7wvhcr7nvk5zl36ppr3xzlkda",
      "pub_key": "lambdavalconspub1zcjduepq2awadjjd9d27ysnng6yp70ysk6crsyxl7ncnp3vyl2sc6fmqr3rss0avyp",
      "proposer_priority": "-14097",
      "voting_power": "5356"
    },
    {
      "address": "lambdavalcons1pkyxplr6kd3wudfvc4zlp5ukpmf6ja7w5r5sc7",
      "pub_key": "lambdavalconspub1zcjduepqagqulz6nyx90xznwdwxsy9z88pyt2xtlz584tsqhdfnvmckk4dyssc9rg7",
      "proposer_priority": "969",
      "voting_power": "969"
    },
    {
      "address": "lambdavalcons1xa3ervadz9xcfym66xhv64tcmsyd407sfme0s5",
      "pub_key": "lambdavalconspub1zcjduepq083fg9q076vcq6f03g58uwlpt9atps5ns246y2sc66ajuwnelwpqr9e7jw",
      "proposer_priority": "878",
      "voting_power": "878"
    },
    {
      "address": "lambdavalcons18d85n0t7z6lprm7gg8kkwt7wxepmra5ghklxcv",
      "pub_key": "lambdavalconspub1zcjduepqdwjlhfaqsyf8en004r69zuvjg0hehqxn08mjevcn7hmjcwptktzsuyavj5",
      "proposer_priority": "1349",
      "voting_power": "1349"
    },
    {
      "address": "lambdavalcons1gskwgpstjggphgqwj9we4have2nhscupcuuc2l",
      "pub_key": "lambdavalconspub1zcjduepq8me4ap8ylrlr77fd49m3gguj5krwat0e64w7h8ydt7l5phqpwyzqx07dpc",
      "proposer_priority": "2676",
      "voting_power": "2676"
    },
    {
      "address": "lambdavalcons106zrgfq5n5lwqlr2c6asxhgtc9nkegt2pqn0c5",
      "pub_key": "lambdavalconspub1zcjduepqxhaz76k9z80cu5ll3hcnhqjfx4sc8t5hjum8dm0wv6x2v2m8qndqvqks62",
      "proposer_priority": "1418",
      "voting_power": "1418"
    },
    {
      "address": "lambdavalcons1sswy028hkgjx6akgzl2238t3nc2tnj5k9ruqzd",
      "pub_key": "lambdavalconspub1zcjduepqyfksn0v024037s7aztmh6mct5rze42gf9yv7e36za9kjedvdwzxqvxsp7n",
      "proposer_priority": "904",
      "voting_power": "904"
    },
    {
      "address": "lambdavalcons1cemm0a995283p6lrypge3l65rqtcsyrrnse2vr",
      "pub_key": "lambdavalconspub1zcjduepqp7ccjeshlpslrzjj75je5kn6dhtq8l5nnl6h5jtavgsf5tyekfsqe4mnh9",
      "proposer_priority": "2608",
      "voting_power": "2608"
    },
    {
      "address": "lambdavalcons165mdt9ry5uejl4df93pve075qcg24npu6ysgzn",
      "pub_key": "lambdavalconspub1zcjduepqtxtq5jqtyvgverlv2xfm9m5qvufmvttqqw8h5a6enp8a0jfja52q647x3r",
      "proposer_priority": "1207",
      "voting_power": "1207"
    },
    {
      "address": "lambdavalcons1mjepwcdfj3yvvkxvqh6anaq33p32hfn3c9j3gv",
      "pub_key": "lambdavalconspub1zcjduepqzjjddwa27xwg3c3pa75v6m84ttfkaew8lx8ftatmmtla6szm2ewsq63pnf",
      "proposer_priority": "911",
      "voting_power": "911"
    },
    {
      "address": "lambdavalcons1l8fcp3wenf6u4er2s7zglysl55afdp7jxhdg2y",
      "pub_key": "lambdavalconspub1zcjduepqdarenj38r6gw7tgfhcjspd05vnde7qyay80u7dzyktalr3fhu5pqpgrtf6",
      "proposer_priority": "1177",
      "voting_power": "1177"
    }
  ]
}
```

