# Price Oracles

Blockchain oracles enable blockchain-based finance by providing real-time, accurate asset price data. This up-to-date pricing is essential for operations like on-chain purchases, token swaps, staking, and loans.

Chronicle's Scribe Oracle delivers these price updates through a network of 22 trusted feed operators, ensuring reliable and timely asset valuation on the blockchain.

## Oracle Reader

Using the `OracleReader-Example`, dApps can easily integrate the Scribe oracle into their codebase.

The contract has:

- Set as a public variable in the constructor during deployment, it aligns with the IChronicle interface, which is standard across all Chronicle Oracles.

```solidity
 IChronicle public chronicle;
```

- An external function `read()`, which gets the price from the oracle at zero gas cost. The function returns two values,  `val`, which is the current price, and `age`, which is the last timestamp at which the price was updated.

```solidity
 function read() external view returns (uint, uint) 
```

## Deployment

## Foundry

For deploying via Foundry, take a look at the script available at `script/OracleReaderScript.s.sol`. This script requires an Oracle address, an RPC URL, and a private key.

An example deployment for the `MKR/USD` `OracleReader` on `Polygon zkEVM Testnet`, the foundry deployment would be:

```solidity
contract OracleReaderScript is Script {
    
    function deploy() public {

        // Address of MKR/USD = 0xE61A66f737c32d5Ac8cDea6982635B80447e9404

        address oracle = address(0xE61A66f737c32d5Ac8cDea6982635B80447e9404);

        OracleReader deployed = new OracleReader(oracle);

        console.log("OracleReader deployed at", deployed);
    }

   
    function read() public {
        // Address of your deployed OracleReader.
        OracleReader reader = OracleReader(address(0));

        uint val;
        uint age;
        (val, age) = reader.read();

        console.log("Val", val);
        console.log("Age", age);
    }
}
```

On the command line, run the command below to deploy:

```shell
forge script script/OracleReaderScript.s.sol --rpc-url <rpc_url> --private-key <private_key>  --sig $(cast calldata "deploy()"  -vv
```

This deploys the contract and returns the address of the Oracle reader.

## Hardhat

Deployment using hardhat is also a straightforward process. In your `scripts/deploy.js` input the following:

```js
// imports
const { ethers } = require("hardhat")

// async main
async function main() {
  const OracleReaderFactory = await ethers.getContractFactory("OracleReader")
         // Address of MKR/USD = 0xE61A66f737c32d5Ac8cDea6982635B80447e9404
  const oracleReader = await OracleReaderFactory.deploy(0xE61A66f737c32d5Ac8cDea6982635B80447e9404)
  await oracleReader.deployed()
  console.log(`Deployed contract to: ${oracleReader.address}`)
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
```

In the ``hardhat.config.js``, paste the setup below:

```js
require("@nomiclabs/hardhat-toolbox")
require("dotenv").config()


const zkEVM_RPC_URL = `https://rpc.public.zkevm-test.net` 
const PRIVATE_KEY = process.env.PRIVATE_KEY 

module.exports = {
  networks: {
    zkEVM: {
      url: zkEVM_RPC_URL,
      accounts: [PRIVATE_KEY],
    }
  },
  solidity: "0.8.9",
}
```

On the command line, run the command below to deploy:

```shell
npx hardhat compile
npx hardhat run scripts/deploy.js --network zkEVM
```

This deploys the contract and returns the address of the Oracle reader.
