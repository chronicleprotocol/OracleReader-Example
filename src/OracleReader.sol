// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {IChronicle} from "./IChronicle.sol";

contract OracleReader {
    IChronicle public chronicle;

    constructor(address oracle) {
        chronicle = IChronicle(oracle);
    }

    // Function to read the latest data from the Chronicle oracle
    // @return val: The current value returned by the oracle
    // @return age: The timestamp of the last update from the oracle
    function read() external view returns (uint, uint) {
        uint val;
        uint age;
        (val, age) = chronicle.readWithAge();

        return (val, age);
    }
}
