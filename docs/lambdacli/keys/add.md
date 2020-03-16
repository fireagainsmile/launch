# lambdacli keys add

## Description

Create a new key, or recover from mnemonic

## Usage

```
lambdacli keys add <name> [flags]
```

## Flags

| Name, shorthand | Default   | Description                                                       | Required |
| ---------------   | --------- | ----------------------------------------------------------------- | -------- |
| --account         |           | Account number for HD derivation                         |          |
| --dry-run         |           | Perform action, but don't add key to local keystore               |          |
| --generate-miner  |           | generate related miner private key file(used for miner node server) |          |
| --help, -h        |           | Help for add                                                      |          |
| --indent          |           | Add indent to JSON response                                                      |          |
| --index uint32    |           | Add indent to JSON response                           |          |
| --interactive, -i |           | Interactively prompt user for BIP39 passphrase and mnemonic       |          |
| --ledger  |           | Store a local reference to a private key on a Ledger device       |          |
| --multisig strings   |           | Construct and store a multisig public key (implies --pubkey)       |          |
| --multisig-threshold uint   |           | K out of N required signatures. For use in conjunction with --multisig (default 1)       |          |
| --no-backup       |           | Don't print out seed phrase (if others are watching the terminal) |          |
| --nosort   |           | Keys passed to --multisig are taken in the order they're supplied       |          |
| --pubkey string    |           | Parse a public key in bech32 format and save it to disk       |          |
| --recover         |           | Provide seed phrase to recover existing key instead of creating   |          |                 |          |

## Examples

### Create a new key

```shell
lambdacli keys add peter
```

You'll be asked to enter a password for your key, note: password must be at least 8 characters.

```txt
Enter a passphrase for your key:
Repeat the passphrase:
```

After that, you're done with creating a new key, but remember to backup your seed phrase, it is the only way to recover your account if you ever forget your password or lose your key.

```txt
NAME:   TYPE:   ADDRESS:                                        PUBKEY:
peter   local   lambda12cakj7qkdygnfappnly8ykf0v23f44qjckc9e6   lambdapub1addwnpepqwv2zv6mm56shz6s8uxz2pklmzjcj8y9kj0f53wruccqjp4jcppl5egr8cz

**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.

urban limb reward theme wealth march alien spoon lemon vanish sting never angle olympic thunder spare upgrade endless pause sting sheriff gorilla taxi elder
```

### Recover an existing key

If you forget your password or lose your key, or you wanna use your key in another place, you can recover your key by your seed phrase.

```txt
lambdacli keys add MyKey --recover
```

You'll be asked to enter a new password for your key, and enter the seed phrase. Then you get your key back.

```txt
Enter a passphrase to encrypt your key to disk:
Repeat the passphrase:
> Enter your bip39 mnemonic
```

### Create a new miner key with subaccount

```shell
lambdacli keys add peter --generate-miner
```

You'll be asked to enter a password for your key, note: password must be at least 8 characters.

```txt
Enter a passphrase to encrypt your key to disk:
Repeat the passphrase:
```

After that, you're done with creating a new miner key with subaccount key file `peter_miner_key.json`, but remember to backup your seed phrase, it is the only way to recover your account if you ever forget your password or lose your key.

```txt
NAME:	TYPE:	ADDRESS:					PUBKEY:
peter	local	lambda15rdqh86mnegp48ef2cjkcyshuny8haqkta3w0e	lambdapub1addwnpepq2tnd225vy238vwlxh5w2nwufd4zwp843zm0a6als7dwnenl7wnysm07n56

**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.

maid idea agree toward lazy mushroom question bamboo merge cave legal adjust tree peace question raw absorb club dial fashion limit hungry hospital thank

Miner key file is generated at peter_miner_key.json
```

### Create multisig account

Create a multisig account with 3 sub-accounts，specify the minimum number of signatures，such as 2. The tx could be broadcast only when the number of signatures is greater than or equal to 2.

```  
lambdacli keys add <multi_account_keyname> --multisig-threshold=2 --multisig=<signer_keyname_1>,<signer_keyname_2>,<signer_keyname_3>...
```

::: tips
<signer_keyname> could be the type of "local/offline/ledger"， but not "multi" type。

Offline account can be created by "lambdacli keys add --pubkey". 
:::

How to use multisig account to broadcast a transaction， please refer to [multisig](../tx/multisign.md)

