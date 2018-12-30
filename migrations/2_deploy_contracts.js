var Elections = artifacts.require("./Election.sol");

module.exports = function(deployer) {
  deployer.deploy(Elections);
};

