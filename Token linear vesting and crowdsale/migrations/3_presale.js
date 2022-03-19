const Token = artifacts.require("./XYZToken");
const PreSale = artifacts.require("./preSale.sol");

module.exports = (deployer, network, [owner]) => {
  return deployer
    .then(() => deployer.deploy(Token,"XYZToken", "XYZ", 100000000)
    .then(() => deployer.deploy(PreSale, 10000, owner, SimpleToken.address, owner))
    .then(() => Token.deployed())
    .then(token => token.increaseApproval(PreSale.address, 1000000 * (10 ** 18))));
};