# Oracle Reader Example

_Chronicle Protocol_'s oracles bridge the gap between blockchains and real-world by reliably providing up-to-date verifiable data onchain.

This repository contains an example Solidity contract showing how _Chronicle Protocol_'s oracle contract, `Scribe`, can be read.

## The `OracleReader` Contract

The `OracleReader` contract in `src/OracleReader.sol` reads the current value and its respective age provided by the _Chronicle Protocol_ ETH/USD oracle on the Sepolia testnet.

You can find a list of supported oracles [here](https://docs.chroniclelabs.org/).

Every _Chronicle Protocol_ implements the `IChronicle` interface, a standard interface for reading oracles.

Via `OracleReader`'s public `read()` function everyone is able to read the oracle's current value and age from the contract.

## Deployment

To deploy the `OracleReader` via Foundry take a look at the script in `script/OracleReaderScript.s.sol`.

In order to deploy, you'll need to have a Sepolia RPC URL and a private key with some ETH.

```bash
$ forge script --broadcast --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --sig $(cast calldata "deploy()") -vvv script/OracleReader.s.sol:OracleReaderScript
```

Note to not forget to substitute `<RPC_URL>` and `<PRIVATE_KEY>` with your respective values.
