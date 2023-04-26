const { ethers, upgrades } = require("hardhat");
const BUYER = "0x6FB412698FE447625D1F0E2ACeD564aD48ac5e75";
const Seller = "0x2270E86D79c463A81254A9FA8871B6D151e792a9";
async function main() {

 
 const Escrow = await ethers.getContractFactory("Escrow");

 console.log("Deploying Escrow...");

 const escrow = await upgrades.deployProxy(Escrow, [BUYER,Seller], {
   initializer: "initialize",
 });
 await escrow.deployed();

 console.log("escrow deployed to:", escrow.address);
}

main();