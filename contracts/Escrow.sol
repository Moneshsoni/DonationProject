// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Escrow{
    address public buyer;
    address payable seller;
    enum ComState{Start,Deliver,Coplete}
    ComState public state;

    constructor(address _buyer, address payable _seller){
        buyer = _buyer;
        seller = _seller;
    }

    modifier onlyBuyer(){
        require(msg.sender == buyer,"Only owner can Call");
        _;
    }

    function deposit()external payable onlyBuyer{
        require(state == ComState.Start,"Not Deliver");
        state = ComState.Deliver;
    }

    function ReleaseFund()external onlyBuyer{
        require(state==ComState.Deliver,"This is not Deliver yer");
        seller.transfer(address(this).balance);
        state = ComState.Coplete;
    }
}