// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Company{
    address public company;
    address public user;
    string public name;
    constructor(address _user, string memory _name)payable{
        company = msg.sender;
        user = _user;
        name = _name;
    }
}


