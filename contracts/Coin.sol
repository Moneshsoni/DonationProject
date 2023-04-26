// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Coin{
    mapping(address => uint)public balances;
    address public owner;
    constructor(){
        owner = msg.sender;
    }
}