// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DataLocations{

    uint public num;
    uint[] public arr;
    mapping(uint=> address)map;
    struct MyStruct{
        uint foo;
    }

    uint[] public myArray;

    mapping(uint => MyStruct)myStructs;

    //Create functions
    function f()public{
        //Call _f with state variables
        _f(arr,map,myStructs[1]);

        //Get a struct from a mapping

        MyStruct storage myStruct = myStructs[1];
        MyStruct memory myMemStruct = MyStruct(0);

    }

    //create internal functions 
    function _f(uint[] storage _arr, mapping(uint => address)storage _map,MyStruct storage _myStruct
    )internal{
        arr = _arr;



    }

    function assertFunC(uint _num)public{
        assert(_num == 10);
        num = _num;
    }

    bool public value;

    error YouAreNotNum(bool youARenot);
    function setBoolErr(bool _bool)external{
        if(_bool == false){
            revert YouAreNotNum({youARenot:_bool});
        }
        value = _bool;

    }

    uint public number;

    function RevertFunc(uint _number)public{
        if(_number<=10){
            revert("Number should be greater than 10");
        }
        number = _number;
    }

    function g(uint[] memory _arr)public returns(uint[] memory){

    }

    function h(uint[] calldata _arr)external{

    }

    function setArrVal(uint[] memory _arr)public{
        myArray = _arr;
    }

    function getArr()public view returns(uint[] memory){
        return myArray;
    }

    function getSort()public view returns(uint){
        return myArray[1];
    }
}