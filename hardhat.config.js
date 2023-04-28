require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
module.exports = {
  solidity: {
    compilers:[
      {
        version: "0.8.9",
      },
      {
        version: "0.8.10",
      },
    ]
  }

  // networks: {
  //   matic: {
  //     url: `https://polygon-mumbai.g.alchemy.com/v2/wopBKVjhOCSLdjwKIuMNsZO6PaG9IKqV`,
  //     accounts: [process.env.PRIVATE_KEY],
  //   },
  // },

  // etherscan: {
  //   apiKey: process.env.ETHERSCAN_API_KEY,
  // },
};
