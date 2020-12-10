pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/smartContract.sol";

contract TestSmartContract {
  // The address of the SmartContract contract to be tested
  SmartContract smartcontract = SmartContract(DeployedAddresses.SmartContract());

  // The expected values of the variables
  uint expectedNumberOfColumns = 2;
  bool expectedDoorsStatus = true;
  bool expectedBrakeStatus = true;
  bool expectedCableStatus = true;
  bool expectedBatteryStatus = true;
  


  // Testing the getNumberOfColumns() function
  function testgetNumberOfColumns() public {     

    uint returnedNumberOfColumns = smartcontract.getNumberOfColumns(2);

    Assert.equal(
        returnedNumberOfColumns,
        expectedNumberOfColumns,
        "Function does not return the expected number of columns."
    );
  }

  // Testing the getDoorsStatus() function
  function testgetDoorsStatus() public {     

    bool returnedDoorsStatus = smartcontract.getDoorsStatus(true);

    Assert.equal(
        returnedDoorsStatus,
        expectedDoorsStatus,
        "Function does not return the expected status of the doors."
    );
  }

  // Testing the getBrakeStatus() function
  function testgetBrakeStatus() public {     

    bool returnedBrakeStatus = smartcontract.getBrakeStatus(true);

    Assert.equal(
        returnedBrakeStatus,
        expectedDoorsStatus,
        "Function does not return the expected status of the brakes."
    );
  }

  // Testing the getCableStatus() function
  function testgetCableStatus() public {     

    bool returnedCableStatus = smartcontract.getCableStatus(true);

    Assert.equal(
        returnedCableStatus,
        expectedCableStatus,
        "Function does not return the expected status of the cables."
    );
  }

  // Testing the getBatteryStatus() function
  function testgetBatteryStatus() public {     

    bool returnedBatteryStatus = smartcontract.getBatteryStatus(true);

    Assert.equal(
        returnedBatteryStatus,
        expectedBatteryStatus,
        "Function does not return the expected status of the battery."
    );
  }



} 