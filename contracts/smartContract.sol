pragma solidity >=0.4.22 <0.8.0;

contract SmartContract {

    uint numberOfColumns;
    bool doorsStatus;
    bool brakeStatus;  
    bool cableStatus; 
    bool batteryStatus;
    //bool result;   

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

    function getNumberOfColumns(uint _numberOfColumns) public pure returns(uint){
        return _numberOfColumns;
    }
    function getDoorsStatus(bool _doorsStatus) public pure returns(bool){
        return _doorsStatus;
    }
    function getBrakeStatus(bool _brakeStatus) public pure returns(bool){
        return _brakeStatus;
    }
    function getCableStatus(bool _cableStatus) public pure returns(bool){
        return _cableStatus;
    }
    function getBatteryStatus(bool _batteryStatus) public pure returns(bool){
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
            columnList[i].isDoorsTestPass = getDoorsStatus(doorsStatus);
            columnList[i].isBrakesTestPass = getBrakeStatus(brakeStatus);
            columnList[i].isCableTestPass = getCableStatus(cableStatus);
            columnList[i].hasBatteryOperatingPermit = getBatteryStatus(batteryStatus);
            generateCertificate(i, columnList[i].isDoorsTestPass, columnList[i].isBrakesTestPass, columnList[i].isCableTestPass, columnList[i].hasBatteryOperatingPermit);
        }
    }

    function isProductAproved(uint _numberOfColumns) public returns(bool)
    {   
        for (uint i = 0; i < _numberOfColumns; i++)   {
            p.isAproved = true;
            if (columnList[i].hasColumnCertificateOfConformity != true)
            {
                p.isAproved = false;
            }
            return p.isAproved;
        }
    }  

    bool result = isProductAproved(numberOfColumns);   
   
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