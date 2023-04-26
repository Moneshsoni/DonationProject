const { ethers, upgrades } = require("hardhat");

const PROXY = 0xBA36a1554fFca828aAC13eb3190f2cf024be9f6D;

async function main() {
 const PizzaV2 = await ethers.getContractFactory("PizzaV2");
 console.log("Upgrading Pizza...");
 await upgrades.upgradeProxy(PROXY, PizzaV2);
 console.log("Pizza upgraded successfully");
}

main();