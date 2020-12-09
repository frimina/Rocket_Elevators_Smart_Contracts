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

    function getNumberOfColumns(uint _numberOfColumns) public returns(uint numberOfColumns){
        return _numberOfColumns;
    }
    function getDoorsStatus(bool _doorsStatus) public returns(bool doorsStatus){
        return _doorsStatus;
    }
    function getBrakeStatus(bool _brakeStatus) public returns(bool brakeStatus){
        return _brakeStatus;
    }
    function getCableStatus(bool _cableStatus) public returns(bool cableStatus){
        return _cableStatus;
    }
    function getBatteryStatus(bool _batteryStatus) public returns(bool batteryStatus){
        return _batteryStatus; 
    }

    function generateCertificate(uint i, bool _isDoorsTestPass, bool _isBrakesTestPass, bool _isCableTestPass, bool _hasBatteryOperatingPermit) public {
        if (_isDoorsTestPass == true && _isBrakesTestPass == true && _isCableTestPass == true && _hasBatteryOperatingPermit == true)
        {
             columnList[i].hasColumnCertificateOfConformity = true;
        }
    } 

    function verifyColumn() public
    {
        for (uint i = 0; i < numberOfColumns; i++)   {
            columnList[i].isDoorsTestPass = getDoorsStatus();
            columnList[i].isBrakesTestPass = getBrakeStatus();
            columnList[i].isCableTestPass = getCableStatus();
            columnList[i].hasBatteryOperatingPermit = getBatteryStatus();
            generateCertificate(i, columnList[i].isDoorsTestPass, columnList[i].isBrakesTestPass, columnList[i].isCableTestPass, columnList[i].hasBatteryOperatingPermit);
        }
    }

    function isProductAproved() external returns(bool isAproved)
    {   
        for (uint i = 0; i < numberOfColumns; i++)   {
            p.isAproved = true;
            if (columnList[i].hasColumnCertificateOfConformity != true)
            {
                p.isAproved = false;
            }
            return p.isAproved;
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