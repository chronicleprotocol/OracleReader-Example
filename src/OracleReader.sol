// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {IChronicle} from "./IChronicle.sol";

contract OracleReader {
    IChronicle public chronicle;

    constructor(address oracle) {
        chronicle = IChronicle(oracle);
    }

    function read() external view returns (uint, uint) {
        uint val;
        uint age;
        (val, age) = chronicle.readWithAge();

        return (val, age);
    }
}
