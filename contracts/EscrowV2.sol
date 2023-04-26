// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Escrow.sol";
contract EscrowV2 is Escrow{

    event BuyerAmout(address buyer,uint amout);
    event SellerRecive(address seller,uint amout);

    function deposit()external payable override virtual onlyBuyer{
        require(state == ComState.Start,"Not Deliver");
        state = ComState.Deliver;
        emit BuyerAmout(msg.sender,msg.value);
    }

    function ReleaseFund()external override virtual onlyBuyer{
        require(state==ComState.Deliver,"This is not Deliver yer");
        seller.transfer(address(this).balance);
        state = ComState.Complete;
        emit SellerRecive(seller,address(this).balance);
    }


}
