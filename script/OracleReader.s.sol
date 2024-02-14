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
    ///         -vvvv \
    ///         script/OracleReader.s.sol:OracleReaderScript
    ///      ```
    function deploy() public {
        vm.broadcast();
        OracleReader deployed = new OracleReader();

        console.log("OracleReader deployed at", address(deployed));
    }

    /// @dev Read via:
    ///
    ///      ```bash
    ///      forge script \
    ///         --rpc-url <rpc_url> \
    ///         --sig $(cast calldata "read()" \
    ///         -vvvv \
    ///         script/OracleReader.s.sol:OracleReaderScript
    ///      ```
    function read() public view {
        // TODO: Replace `0x0` with the address of your deployed OracleReader.
        OracleReader reader = OracleReader(address(0x25bD61dD2c503dD4EF3f730D71E127bA7FeDDc79));

        uint256 val;
        uint256 age;
        (val, age) = reader.read();

        console.log("Val", val);
        console.log("Age", age);
        console.log("Note that val is in 18 decimal precision");
    }
}
