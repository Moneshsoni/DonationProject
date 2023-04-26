// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Coin{
    mapping(address => uint)public balances;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(owner==msg.sender,"You are not the Owner");
        _;
    }

    function mint(address receiver,uint amount)public OnlyOwner{
        balances[receiver] += amount;
    }


    function getBalance(address receiver)public view returns(uint){
        return balances[receiver];
    }

    function send(address receiver,uint amount)public{
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }
    
}