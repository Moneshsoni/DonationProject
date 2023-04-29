const {ethers} = require("hardhat");
const { expect } = require("chai");
describe("Test EscrowV2",()=>{
    let Escrow;
    let escrow;
    let buyer;
    let seller;

    beforeEach(async ()=>{
        Escrow = await ethers.getContractFactory("Escrow");
        escrow = await Escrow.deploy();
        [buyer,seller] = await ethers.getSigners();
        console.log("Contract address",escrow.address);

    })
    describe("Start Test Cases",async ()=>{
        it("Should check Iniitialize and Deposit and release",async ()=>{
            await escrow.connect(buyer).initialize(buyer.address,seller.address);
            console.log("State",await escrow.state());
            await escrow.connect(buyer).deposit({value: ethers.utils.parseEther("1")});
            console.log("Get Balance",await escrow.getBalance());
            console.log("State",await escrow.state());
            await escrow.connect(buyer).ReleaseFund();
            console.log("Get Balance",await escrow.getBalance());
            console.log("State",await escrow.state());
        })
    })

})