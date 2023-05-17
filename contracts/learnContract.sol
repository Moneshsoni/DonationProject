// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Test{
    bool public number;
    address[] public owners;
    mapping(address=>bool)public isOwner;
    // bool public isOwner;
    function setNum(bool _num)public{
        require(!_num,"The value is not proceed");
        number = _num;
    }

    function setOwner(address[] memory _owners)public{
        for(uint i=0;i<_owners.length;i++){
            address owner = _owners[i];
            require(owner != address(0), "invalid owner");
            isOwner[owner] = true;
            owners.push(owner);

        }
    }

    function getOwners()public view returns(address[] memory){
        return owners;
    }
}

