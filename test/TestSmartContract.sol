pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/smartContract.sol";

contract TestSmartContract {
  // The address of the SmartContract contract to be tested
  SmartContract smartcontract = SmartContract(DeployedAddresses.SmartContract());

  uint expectedNumberOfColumns = 2;

  // Testing the getNumberOfColumns() function
  function testgetNumberOfColumns() public {     

    uint returnedNumberOfColumns = smartcontract.getNumberOfColumns(2);

    Assert.equal(
        returnedNumberOfColumns,
        expectedNumberOfColumns,
        "Function does not return the expected number of columns."
    );
  }

} 