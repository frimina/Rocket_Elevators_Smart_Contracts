pragma solidity >=0.4.22 <0.8.0;

contract SmartContract {

    uint numberOfColumns;    

    struct Column {
        bool isDoorsTestPass;   
        bool isBrakesTestPass;
        bool isCableTestPass;
        bool hasBatteryOperatingPermit;
        bool hasColumnCertificateOfConformity;
        uint columnNumber;         
    } 

    Column[] public columnList;
    
    struct Product {
        string client;
        string name;
        string component;
        bool isAproved;
        uint quantity;
        uint64 price;
        uint columnNumber;            
    }
    Product p;

    function getNumberOfColumns(uint _numberOfColumns) public returns(uint _numberOfColumns){
        return _numberOfColumns;
    }
    function doorsStatus(bool _doorsStatus) public returns(bool _doorsStatus){
        return _doorsStatus;
    }
    function brakeStatus(bool _brakeStatus) public returns(bool _brakeStatus){
        return _brakeStatus;
    }
    function cableStatus(bool _cableStatus) public returns(bool _cableStatus){
        return _cableStatus;
    }
    function batteryStatus(bool _batteryStatus) public returns(bool _batteryStatus){
        return _batteryStatus; 
    }

    function generateCertificate(bool _isDoorsTestPass, bool _isBrakesTestPass, bool _isCableTestPass, bool _hasBatteryOperatingPermit) public {
        if (_isDoorsTestPass == true && _isBrakesTestPass == true && _isCableTestPass == true && _hasBatteryOperatingPermit == true)
        {
            self.hasColumnCertificateOfConformity = true;
        }
    } 

    for (uint i = 0; i < numberOfColumns; i++)   {
        columnList[i].isDoorsTestPass = doorsStatus(_doorsStatus);
        columnList[i].isBrakesTestPass = brakeStatus(_brakeStatus);
        columnList[i].isCableTestPass = cableStatus(_cableStatus);
        columnList[i].hasBatteryOperatingPermit = batteryStatus(_batteryStatus);
        generateCertificate(self.isDoorsTestPass, self.isBrakesTestPass, self.isCableTestPass, self.hasBatteryOperatingPermit)
    }

    function isProductAproved() external returns(bool isAproved)
    for (uint i = 0; i < numberOfColumns; i++)   {
        p.isAproved = true;
        if (column[i].hasColumnCertificateOfConformity != true)
        {
            p.isAproved = false;
        }
        return p.isAproved
    }

            
    //function that will return true if the test passes    
    // function columnStatus(bool status) public {
    //     column = status;
    // }    

    //function generateCertificate(bool self.isDoorsTestPass, bool self.isBrakesTestPass, bool self.isCableTestPass, bool self.hasBatteryOperatingPermit) public {
    function generateCertificate(bool self.isDoorsTestPass, bool self.isBrakesTestPass, bool self.isCableTestPass, bool self.hasBatteryOperatingPermit) public {
        if (self.isDoorsTestPass == true && self.isBrakesTestPass == true && self.isCableTestPass == true && self.hasBatteryOperatingPermit == true)
        {
            hasColumnCertificateOfConformity = true;
        }
    }    


    // //function to get the value of certificte list
    // function getCertificate(uint initial) public view returns(uint) {
    //     return certificate_of_conformity_list[initial];
    // }
    

    // //function to get the number of certificates
    // function getNumberOfCertificate() public view returns(uint) {
    //     return certificate_of_conformity_list.length;
    // }

//https://medium.com/better-programming/how-to-test-ethereum-smart-contracts-35abc8fa199d
//https://medium.com/@yangnana11/solidity-function-types-4ad4e5de6d56
    
}