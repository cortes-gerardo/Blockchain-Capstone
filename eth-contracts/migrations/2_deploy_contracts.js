// migrating the appropriate contracts
var RealEstateToken = artifacts.require("RealEstateToken")
var Verifier = artifacts.require("Verifier");
var SolnSquareVerifier = artifacts.require("SolnSquareVerifier");

module.exports = function(deployer) {
  deployer.deploy(RealEstateToken);
  deployer.deploy(Verifier).then(function() {
    return deployer.deploy(SolnSquareVerifier, Verifier.address);
  })
};
