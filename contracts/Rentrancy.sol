// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Rentray{
    bool public locked;
    uint public x=10;

    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}