//var Adoption = artifacts.require("Adoption");
var smartContract = artifacts.require("smartContract");


module.exports = function(deployer) {
  //deployer.deploy(Adoption);
  deployer.deploy(smartContract);
};

