// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
contract Coin is Initializable,UUPSUpgradeable,OwnableUpgradeable{
    uint public totalSupply;
    uint public totalAmount;
    mapping(address => uint)public balances;
    address  creator;
    event Balance_Send(uint amount,address user);

    function initialize()public initializer{
        creator = msg.sender;
        __Ownable_init();
    }

    ///@dev required by the OZ UUPS module
    function _authorizeUpgrade(address) internal override onlyOwner {}
    
    modifier OnlyOwner(){
        require(creator==msg.sender,"You are not the Owner");
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
        emit Balance_Send(amount,msg.sender);
    }


    function getBalance(address receiver)public view returns(uint){
        return balances[receiver];
    }


    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    function send(address receiver,uint amount)public{
        if(balances[msg.sender]>amount){
            revert InsufficientBalance({requested:amount,available:balances[msg.sender]});
        }
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }

    function RetOwner()public view returns(address){
        return creator;
    }
    
}