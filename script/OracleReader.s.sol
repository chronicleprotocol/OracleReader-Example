// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {Script} from "forge-std/Script.sol";
import {console2 as console} from "forge-std/console2.sol";

import {OracleReader} from "src/OracleReader.sol";

contract OracleReaderScript is Script {
    /// @dev Deploy via:
    ///
    ///      ```bash
    ///      forge script \
    ///         --broadcast \
    ///         --rpc-url <rpc_url> \
    ///         --private-key <private_key> \
    ///         --sig $(cast calldata "deploy()" \
    ///         -vv \
    ///         script/OracleReader.s.sol:OracleReaderScript
    ///      ```
    function deploy() public {
        // TODO: Replace `0x0` with the address of the oracle you want to read.
        address oracle = address(0x0);

        OracleReader deployed = new OracleReader(oracle);

        console.log("OracleReader deployed at", deployed);
    }

    /// @dev Read via:
    ///
    ///      ```bash
    ///      forge script \
    ///         --rpc-url <rpc_url> \
    ///         --sig $(cast calldata "read()" \
    ///         -vv \
    ///         script/OracleReader.s.sol:OracleReaderScript
    ///      ```
    function read() public {
        // TODO: Replace `0x0` with the address of your deployed OracleReader.
        OracleReader reader = OracleReader(address(0x0));

        uint val;
        uint age;
        (val, age) = reader.read();

        console.log("Val", val);
        console.log("Age", age);
    }
}
