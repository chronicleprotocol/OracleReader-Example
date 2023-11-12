### Price Oracles

Blockchain oracles enable blockchain-based finance by providing real-time, accurate asset price data. This up-to-date pricing is essential for operations like on-chain purchases, token swaps, staking, and loans. 

Chronicle's Scribe Oracle delivers these price updates through a network of 22 trusted feed operators, ensuring reliable and timely asset valuation on the blockchain.

### Oracle Reader
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