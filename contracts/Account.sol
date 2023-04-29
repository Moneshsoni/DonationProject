// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Account{
    uint balance;
    function setBalance(uint amount)external{
        uint oldBalance = balance;
        uint newBalance = amount + balance;
        require(newBalance>=oldBalance,"Value is overflow");
        balance = newBalance;
        assert(balance>=oldBalance);
    }

    //get Balance of user
    function getBalance()public view returns(uint){
        return balance;
    }

    //Withdraw functions
    function Withdraw(uint amount)external{
        uint oldBalance = balance;
        require(amount<= balance,"Value should be less than balance");
        balance -= amount;
        assert(balance<= oldBalance);
    }
}
      