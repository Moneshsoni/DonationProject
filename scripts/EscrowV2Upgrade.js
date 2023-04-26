const { ethers, upgrades } = require("hardhat");

const PROXY = "0xBA36a1554fFca828aAC13eb3190f2cf024be9f6D";

async function main() {
 const EscrowV2 = await ethers.getContractFactory("EscrowV2");
 console.log("Upgrading EscrowV2...");
 await upgrades.upgradeProxy(PROXY, EscrowV2);
 console.log("EscrowV2 upgraded successfully");
}

main();