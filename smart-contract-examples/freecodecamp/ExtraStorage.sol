// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import './SimpleStorage.sol';

contract ExtraStorage is SimpleStorage {
    // Override store() function in SimpleStorage contract
    function store(uint256 _favouriteNumber) public override {
        favouriteNumber = _favouriteNumber + 1;
    }
}
