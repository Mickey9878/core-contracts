require("dotenv").config();
require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "hardhat",
  solidity: {
    version: "0.5.17",
    settings: {
      optimizer: {
        enabled: true
      }
    }
  },
  networks: {
    testnet: {
      url: "https://api.s0.b.hmny.io",
      accounts: [`0x${process.env.DEPLOY_PRIVATE_KEY}`],
      gas: 50000000,
      gasPrice: 5000000000
    },
    mainnet: {
      url: "https://api.harmony.one",
      accounts: [`0x${process.env.DEPLOY_PRIVATE_KEY}`],
      gas: 50000000,
      gasPrice: 5000000000
    }
  }
};
