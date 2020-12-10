const Migrations = artifacts.require("./Migrations.sol");
const QualityControl = artifacts.require("QualityControl");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(QualityControl);
};
