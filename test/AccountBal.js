const {ethers} = require("hardhat");
const { expect } = require("chai");
require("@nomicfoundation/hardhat-chai-matchers");
describe("Account Balance",()=>{
    let accountAddd;
    let account
    
    beforeEach(async ()=>{
        accountAddd = await ethers.getContractFactory("Account");
         account = await accountAddd.deploy();
        // console.log("Contract address ",account.address);
    })
    describe("Write test cases for account contract",async  ()=>{
        it("Set the Balance",async()=>{
            await account.setBalance(1000);
            console.log(await account.getBalance());
        })

        it("Should check Withdraw functions",async()=>{
            await account.setBalance(100);
            console.log("Before Balance",await account.getBalance());
            await account.Withdraw(10);
            console.log("After withdraw Balance",await account.getBalance());
        })

        //Negative Test cases
        it("Should check withdraw Underflow",async ()=>{
            await account.setBalance(10);
           await  expect(account.Withdraw(11)).to.be.revertedWith("Value should be less than balance");
        })
    })
})