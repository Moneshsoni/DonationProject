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

    event BuyerAmout(address buyer,uint amout);
    event SellerRecive(address seller,uint amout);

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

    function deposit()external payable onlyBuyer{
        require(state == ComState.Start,"Not Deliver");
        state = ComState.Deliver;
        emit BuyerAmout(msg.sender,msg.value);
    }

    function ReleaseFund()external onlyBuyer{
        require(state==ComState.Deliver,"This is not Deliver yer");
        seller.transfer(address(this).balance);
        state = ComState.Complete;
        emit SellerRecive(seller,address(this).balance);
    }

    function add(uint a,uint b)public pure returns(uint){
        return a+b;
    }
}
