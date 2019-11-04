# Install Lambda

This guide will explain how to install the `lambda` and `lambdacli`.
After this installation, you can either become a `full node` or `validator` of [mainnet](./join-mainnet.md)
or [deploy your own testnet](./deploy-testnet.md)

## Install Go

Install `go` by following the [official docs](https://golang.org/doc/install).
Remember to set your `$GOPATH` and `$PATH` environment variables, for example:

```bash
mkdir -p $HOME/go/bin
echo "export GOPATH=$HOME/go" >> ~/.bash_profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bash_profile
source ~/.bash_profile
```

::: tip
**Go 1.12+** is required for the Lambda Chain.
:::

## Install the binaries

Next, let's install `lambda` and `lambdacli`.

```bash
git clone https://github.com/LambdaIM/lambda
cd lambda && make
```

```bash
$ cd build
$ ./lambda version --long
$ ./lambdacli version --long
```

## Next

Now you can [join the mainnet](./join-mainnet.md), or [deploy you own testnet](./deploy-testnet.md)
