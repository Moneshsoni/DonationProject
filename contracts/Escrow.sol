// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Escrow is Initializable, UUPSUpgradeable, OwnableUpgradeable{
    address public buyer;
    address payable seller;
    enum ComState{Start,Deliver,Complete}
    ComState public state;

    function initialize(address _buyer, address payable _seller)public initializer{
        buyer = _buyer;
        seller = _seller;
        __Ownable_init();
    }

    ///@dev required by the OZ UUPS module
    function _authorizeUpgrade(address) internal override onlyOwner {}

    modifier onlyBuyer(){
        require(msg.sender == buyer,"Only owner can Call");
        _;
    }

    function deposit()external payable virtual onlyBuyer{
        require(state == ComState.Start,"Not Deliver");
        state = ComState.Deliver;
    }

    function ReleaseFund()external  virtual onlyBuyer{
        require(state==ComState.Deliver,"This is not Deliver yer");
        seller.transfer(address(this).balance);
        state = ComState.Complete;
    }

    function add(uint a,uint b)public pure returns(uint){
        return a+b;
    }
    
    function getBalance()public view returns(uint){
        return address(this).balance;
    }
}

// buyer 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// seller 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db