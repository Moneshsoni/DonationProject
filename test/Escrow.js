const {ethers} = require("hardhat");
const { expect } = require("chai");
describe("Test EscrowV2",()=>{
    let Escrow;
    let escrow;

    beforeEach(async ()=>{
        Escrow = await ethers.getContractFactory("Escrow");
        escrow = await Escrow.deploy();

        console.log("Contract address",escrow.address);

    })
    describe("Start Test Cases",async ()=>{
        it("Should check address",async ()=>{
            console.log("Address",escrow.address);
        })
    })

})