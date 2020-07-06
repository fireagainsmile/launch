# Lambda wallet account info, signature, configuration description
## 1  Address, mnemonic, encrypt algorithm info.
      Mnemonic words is generated using bip39, wallet and blockchain are both using 256 entropy length,  and the length of the generated mnemonic sentence (MS) is 24 words 

      hd wallet is generated using bip32, the derivePath  is '44\'/364\'/0\'/0/0'

      The address generated in wallet should be consistent with the blockchain address, they are using the same derivePath.

Example


js case

```
const bip39 = require('bip39');
const bip32 = require('bip32');
const crypto = require('crypto');
const secp256k1 = require('secp256k1');
exports.generateRandomMnemonic = function(strength) {
  return bip39.generateMnemonic(strength);
};
/**
 * Get keys (private/public) from mnemonic and path (bip32/39/44).
 *
 * @param  {String} mnemonic        Mnemonic words.
 * @param  {String} path            BIP44 path.
 * @return {Object.<Buffer,Buffer>} Wallet object contains privateKey/publicKey.
 */
exports.getKeysFromMnemonic = function getKeysFromMnemonic(mnemonic, path = '44\'/364\'/0\'/0/0') {
  const seed = bip39.mnemonicToSeedSync(mnemonic);
  const master = bip32.fromSeed(seed);
  const wallet = master.derivePath(path);
  return wallet;
};
```
   Generate address based on the public key 

   After the generated public key is encrypted with SHA256, the output is processed with Ripemd160, then the prefix of lambda is added using bech32.

For example: the lambda addresses are prefixed with 'lambda': `lambda1z4hs23xwjuudm44nhgcde0zxf5y63su8deuqs3`

Down below is a js script example

```
const bech32 = require('bech32');
const Ripemd160 = require('ripemd160');
const crypto = require('crypto');
/**
 * @const lambda bech32 address prefix.
 *
 * @type    {String}
 * @default
 */
const PREFIX = 'lambda';
const PREFIXDev = 'lambdavaloper';
/**
 * Get lambda  address (bech32) from public key.
 *
 * @param  {Buffer} publicKey Public key
 * @return {String}           Bech32 address
 */
exports.getAddress = function getAddress(publicKey) {
  const hash = crypto.createHash('sha256')
    .update(publicKey)
    .digest();
  const address = new Ripemd160().update(hash).digest();
  const words = bech32.toWords(address);
  return bech32.encode(PREFIX, words);
};
```
 lambda  role  prefix  

Bech32PrefixAccAddr = lambda                //lambda address prefix

Bech32PrefixAccPub = lambdapub              //lambda public key prefix

Bech32PrefixValAddr = lambdavaloper         //lambda  operator address prefix

Bech32PrefixValPub = lambdavaloperpub   

Bech32PrefixConsAddr = lambdavalcons

Bech32PrefixConsPub = lambdavalconspub

Bech32PrefixMinerAddr = lambdamineroper      //lambda miner operator address prefix

Bech32PrefixMinerPub = lambdamineroperpub

Bech32PrefixMarketAddr = lambdamarketoper

Bech32PrefixMarketPub = lambdamarketoperpub

## 2 How to sign the data
  Firstly, calculate the hash of the data to be signed using sha256, then secP256K1 and private key is used to sign the calculated result. 

For example:

```
const bip39 = require('bip39');
const bip32 = require('bip32');
const crypto = require('crypto');
const secp256k1 = require('secp256k1');
function sign(bytes, privateKey) {
  const hash = crypto.createHash('sha256')
    .update(bytes)
    .digest();
  return secp256k1.sign(hash, privateKey).signature;
}
```
## 3 Create a miner sub-account
Miners are required to create miner sub-accounts, sub-account is used for mining related tasks, and the function of sub-accounts is mainly used for packing pdp data.  

Commit the mining proof is high-frequency transaction, thus using a sub-account can avoid interfering with the normal transaction operation from the user's account. 

The mnemonic words of the sub account creation is consistent with creating a wallet account.

The derivePath of main account is  '44\'/364\'/0\'/0/0'

The derivePath of miner sub account is '44\'/364\'/0\'/0/1' 

## 4 Wallet configuration, encryption and decryption
Here is a js case

### How to encrypt the data
```
const crypto = require('crypto');
const bcrypt = require('****/bcryptjs');
 //modified bcrypt，should be able to support handling random numbers
const saltRounds = 12;
exports.ExportprivateKey = function encodePrivateKey(privatekey, password) {
	  var usersalt = crypto.randomBytes(16);
       //Generating random numbers
	

	  var salt = bcrypt.genSaltSync(saltRounds, '', usersalt);
        //Bcrypt is used to generate the random salt according to the random numbers 
	

	  var hash = bcrypt.hashSync(password, salt);
        //Generating the hash based on password and salt using bcrypt algrithm 
        
	  const hashs = crypto.createHash('sha256');
	  hashs.update(Buffer.from(hash));
	  const userkey = hashs.digest('hex');
       // Generate the key using sha256 algrithm
	
      // Format conversion, private key equals to praviteFB,  key equals to userkeyFB
       //encrypt the data by calling the encryption method
	  var cryptoResult = encryptSymmetric(praviteFB, '', userkeyFB);
       /*
       encryptSymmetric is one of tendermint encryption methods，
    https://github.com/tendermint/tendermint/blob/3e1516b62427aba1199766fc98943dffe81d7f4b/crypto/xsalsa20symmetric/symmetric.go
       */
	  var Key = toBuffer(cryptoResult);
	  return {
	    salt: usersalt,
	    privateKey: Key
	  };
	};
```
### How to decrypt the data 
```
const saltRounds = 12;
exports.importPrivateKey = function decodePrivateKey(privatekey, usersalt, password) {
	  var salt = bcrypt.genSaltSync(saltRounds, '', usersalt);
       // bcrypt is used to generate the random salt according to the random numbers
	  var hash = bcrypt.hashSync(password, salt);
	   // Generate the hash according to password and random salt 

	  const hashs = crypto.createHash('sha256');
	  hashs.update(Buffer.from(hash));
	  const userkey = hashs.digest('hex');
       // Generate the key by processing the value of sha256 hashed result.
	
      /**
      js format conversion
      privatekeyFB equals to privatekey
      userkeyFB   equals to userkey
      **/
	

	  var seed = decryptSymmetric(privatekeyFB, '', userkeyFB);
      /**
      decryptSymmetric  is one of tendermint encryption methods，
    https://github.com/tendermint/tendermint/blob/3e1516b62427aba1199766fc98943dffe81d7f4b/crypto/xsalsa20symmetric/symmetric
      **/ 
	  if (seed == null || seed.length == 0) {
	    throw new Error('Password error');
	  }
	  var privateKey = toBuffer(seed).slice(5);
	  return privateKey;
	};
```
### How to configure the files
```
{
	"salt": "bXJ0fCwdyta3LYtShoBrSA==",
	"privateKey": "Tghm8vmEY+XtA0IrwGhsm1RM2+WZG+6MvnK34cCM+unP6wC11Uy00Z5q3NiozF91DoIDFgBIEVD0XqSKv+2xjAKDU9WAhS8r1tpKs2A=",
	"name": "the wallet name",
	"address": "lambda17ydyaapgwfp0ekgxmr74szjakn58h79rdyf7a3",
	"publicKey": "lambdapub1addwnpepqvyxh8rxtjymsqty8wkct8hjgf87ueqdrvgpr758x2p32jypzqmcxx269sx"
}
```
The publicKey in the configuration file has 'lambdapub' prefix, processing procedure is as follows.
```
const bech32 = require('bech32');
var Amino = require('****/amino.js');
const PREFIX = 'lambdapub';
Amino.RegisterConcrete(null, 'tendermint/PubKeySecp256k1');

function getAddress(publicKey) {
	  var PubKeyAmino = Amino.MarshalBinary('tendermint/PubKeySecp256k1', publicKey);
// Decode publicKey using Amino
//https://github.com/tendermint/go-amino
	

	  const words = bech32.toWords(PubKeyAmino);
        
	
       //bech32 is used to add the prefix 
	  return bech32.encode(PREFIX, words);
	}
```
Decoding the public key from a prefixed address in the configuration file, the procedure is as follows.
```
function getBytes(publicKeybech32) {
	  const decoded = bech32.decode(publicKeybech32);
	
	  var publicKeyAmino = Buffer.from(bech32.fromWords(decoded.words));
	  var publicKey = Amino.unMarshalBinary('tendermint/PubKeySecp256k1', publicKeyAmino);
	  return publicKey;

	}
```

