// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Prob1{
    uint public num = 5;
    string name;
    address owner;
    enum ActionChoices { 
        GoLeft, 
        GoRight, 
        GoStraight, 
        SitStill 
    }

    ActionChoices choice;


    constructor(){
        owner = msg.sender;
    }

    function SitStill()public{
        choice = ActionChoices.SitStill;
    }

    function getEnumeStatus()public view returns(ActionChoices){
        return choice;
    }

    event ChangeOwner(address oldOwne,address newOwner);

    function setOwner(address new_owner)public{
        require(msg.sender == owner,"You are not the Write to change");
        owner = new_owner;
        emit ChangeOwner(msg.sender,owner);
    }

    function getOwner()public view returns(address){
        return owner;
    }

    function setName(string memory _name)public{
        name = _name;
    }

    function getName()public view returns(string memory){
        return name;
    }

    function Add_zero()public pure returns(address){
        return address(0);
    }
}