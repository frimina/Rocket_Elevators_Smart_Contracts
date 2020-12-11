pragma solidity >=0.4.22 <0.8.0;
//pragma experimental ABIEncoderV2;

contract SmartContract {

    address[16] public clients;
     // define needs
    uint256 public nbElevators;
    uint256 public nbControllers;
    uint256 public nbDoors;
    uint256 public nbButtons;
    uint256 public nbDisplays;
    function setOrder(
        uint256 _nbElevators,
        uint256 _nbControllers,
        uint256 _nbDoors,
        uint256 _nbButtons,
        uint256 _nbDisplays
    ) public {
        nbElevators = _nbElevators;
        nbControllers = _nbControllers;
        nbDoors = _nbDoors;
        nbButtons = _nbButtons;
        nbDisplays = _nbDisplays;
    }
    function getOrder() public view returns (uint256[5] memory) {
        uint256[5] memory myOrder = [
            nbElevators,
            nbControllers,
            nbDoors,
            nbButtons,
            nbDisplays
        ];
        return myOrder;
    }
    uint numberOfColumns;
    bool doorsStatus = true;
    bool brakeStatus;  
    bool cableStatus; 
    bool batteryStatus; 
    bool ProductAproved;
    struct Column {
        bool isDoorsTestPass;   
        bool isBrakesTestPass;
        bool isCableTestPass;
        bool hasBatteryOperatingPermit;
        bool hasColumnCertificateOfConformity;                
    }
    Column[] public columnList;   

    bool public testVariable1 = false;
    // struct Product {
    //     string client;
    //     string name;
    //     string component;
    //     bool isAproved;
    //     uint quantity;
    //     uint64 price;
    //     uint columnNumber;            
    // }    
    // Product p;
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
    function generateCertificate( bool _isDoorsTestPass, bool _isBrakesTestPass, bool _isCableTestPass, bool _hasBatteryOperatingPermit) public pure returns(bool)  {
        if (_isDoorsTestPass == true && _isBrakesTestPass == true && _isCableTestPass == true && _hasBatteryOperatingPermit == true)
        {
            return true;
        }   else
        {
            return false;
        }
    } 
    function verifyColumn() public
    {  
        //Comment this part for testing 
        for (uint i = 0; i < numberOfColumns; i++)   {
            columnList[i].isDoorsTestPass = getDoorsStatus(doorsStatus);
            columnList[i].isBrakesTestPass = getBrakeStatus(brakeStatus);
            columnList[i].isCableTestPass = getCableStatus(cableStatus);
            columnList[i].hasBatteryOperatingPermit = getBatteryStatus(batteryStatus);
            columnList[i].hasColumnCertificateOfConformity = generateCertificate(columnList[i].isDoorsTestPass, columnList[i].isBrakesTestPass, columnList[i].isCableTestPass, columnList[i].hasBatteryOperatingPermit);
        }
        // Use this part to test the function (Leave uncommented for testing only.)
        //testVariable1 = getDoorsStatus(doorsStatus);               
        // Use this part to test the function        
    } 
    
    function isProductAproved(uint _numberOfColumns) public returns(bool)
    {         
        for (uint i = 0; i < _numberOfColumns; i++)   {
            //p.isAproved = true;
            ProductAproved = true;
            if (columnList[i].hasColumnCertificateOfConformity != true)
            {
                //p.isAproved = false;
                ProductAproved = false;
            }            
        }
        //return p.isAproved;
        return ProductAproved;
    }  
    function getClients() public view returns (address[16] memory) {
        return clients; 
    }
}