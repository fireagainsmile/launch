# lambdacli keys mnemonic

## Description

Create a bip39 mnemonic, sometimes called a seed phrase, by reading from the system entropy. To pass your own entropy, use `unsafe-entropy` mode.

## Usage

```
lambdacli keys mnemonic <flags>
```

## Flags

| Name, shorthand  | Default   | Description                                                                   | Required |
| ---------------- | --------- | ----------------------------------------------------------------------------- | -------- |
| --help, -h       |           | help for mnemonic                                                             |          |
| --unsafe-entropy |           | Prompt the user to supply their own entropy, instead of relying on the system |          |

## Examples

### Create a bip39 mnemonic

```shell
lambdacli keys mnemonic
```

You'll get a bip39 mnemonic with 24 words.

```txt
scare current blush fire cat vocal staff exit inherit digital hand february verb tourist check express suggest picture capable afraid put stove airport orphan
```

### Use `unsafe-entropy` mode.

```shell
./lambdacli keys mnemonic --unsafe-entropy
> > WARNING: Generate at least 256-bits of entropy and enter the results here:
<input_your_own_entropy_string>
> Input length: 135 [Y/n]: y
pattern camp now direct damp metal trap valley lunar sun finger fashion rescue bonus scissors imitate pledge enable rude arch cube attack sting math
```