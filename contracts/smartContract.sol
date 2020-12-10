pragma solidity >=0.4.22 <0.8.0;

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
    bool doorsStatus;
    bool brakeStatus;  
    bool cableStatus; 
    bool batteryStatus; 
    struct Column {
        bool isDoorsTestPass;   
        bool isBrakesTestPass;
        bool isCableTestPass;
        bool hasBatteryOperatingPermit;
        bool hasColumnCertificateOfConformity;                
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
        }
        return p.isAproved;
    }  
    function getClients() public view returns (address[16] memory) {
        return clients; 
    }
}