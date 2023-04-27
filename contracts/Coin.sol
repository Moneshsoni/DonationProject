// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Coin{
    uint public totalSupply;
    uint public totalAmount;
    mapping(address => uint)public balances;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(owner==msg.sender,"You are not the Owner");
        _;
    }

    function setMaxSupply(uint _totalSupply)public{
        totalSupply = _totalSupply;
    }

    function mint(address receiver,uint amount)public OnlyOwner{
        require(amount<=totalSupply,"You can't mint greater than maxSupply greater than maxsupply");
        require(totalAmount<totalSupply,"You can't mint more than totalSupply");
        balances[receiver] += amount;
        totalAmount += amount;
    }


    function getBalance(address receiver)public view returns(uint){
        return balances[receiver];
    }

    function send(address receiver,uint amount)public{
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }
    
}