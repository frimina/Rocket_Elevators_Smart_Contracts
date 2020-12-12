pragma solidity ^0.5.16;
//put pragma pragma solidity >=0.4.22 <0.8.0; if it's doesnt work for you


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
  bool expectedhasColumnCertificateOfConformity = true;  
  bool expectedProductState = false;
  bool isDoorsTestPass = true;
  bool isBrakesTestPass = true;
  bool isCableTestPass = true;
  bool hasBatteryOperatingPermit = true; 

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

  // Testing the generateCertificate() function
  function testgenerateCertificate() public {   

    //(bool _isDoorsTestPass, bool _isBrakesTestPass, bool _isCableTestPass, bool _hasBatteryOperatingPermit) 
    bool returnedhasColumnCertificateOfConformity = smartcontract.generateCertificate(isDoorsTestPass, isBrakesTestPass, isCableTestPass, hasBatteryOperatingPermit);
    
    Assert.equal(
        returnedhasColumnCertificateOfConformity,
        expectedhasColumnCertificateOfConformity,
        "Function does not return the expected value of the column certificate."
    );
  }

//   Testing the verifyColumn() function - Due to the difficulty of working with structures of another contract, I will use a variable to test only a part of the function
//   function testverifyColumn() public {    
//     smartcontract.verifyColumn();
//     bool expectedValue = testVariable1;
//     Assert.equal(
//         expectedValue,
//         expectedDoorsStatus,
//         "Function does not return the expected status of the verifyColumn function."
//     );
//   }

//   Testing the isProductAproved() function
//   function testisProductAproved() public { 
    
    
//     bool returnedProductState = smartcontract.isProductAproved(2);
    
//     Assert.equal(
//         returnedProductState,
//         expectedProductState,
//         "Function does not return the expected value  of the column certificate."
//     );
//   }
} 