pragma solidity >=0.4.22 <0.8.0;

contract SmartContract {
    uint256 numberOfColumns;
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
        uint256 quantity;
        uint64 price;
        uint256 columnNumber;
    }

    Product p;

    function getNumberOfColumns(uint256 _numberOfColumns)
        public
        pure
        returns (uint256)
    {
        return _numberOfColumns;
    }

    function getDoorsStatus(bool _doorsStatus) public pure returns (bool) {
        return _doorsStatus;
    }

    function getBrakeStatus(bool _brakeStatus) public pure returns (bool) {
        return _brakeStatus;
    }

    function getCableStatus(bool _cableStatus) public pure returns (bool) {
        return _cableStatus;
    }

    function getBatteryStatus(bool _batteryStatus) public pure returns (bool) {
        return _batteryStatus;
    }

    function generateCertificate(
        uint256 i,
        bool _isDoorsTestPass,
        bool _isBrakesTestPass,
        bool _isCableTestPass,
        bool _hasBatteryOperatingPermit
    ) public {
        if (
            _isDoorsTestPass == true &&
            _isBrakesTestPass == true &&
            _isCableTestPass == true &&
            _hasBatteryOperatingPermit == true
        ) {
            columnList[i].hasColumnCertificateOfConformity = true;
        }
    }

    function verifyColumn() public {
        for (uint256 i = 0; i < numberOfColumns; i++) {
            columnList[i].isDoorsTestPass = getDoorsStatus(doorsStatus);
            columnList[i].isBrakesTestPass = getBrakeStatus(brakeStatus);
            columnList[i].isCableTestPass = getCableStatus(cableStatus);
            columnList[i].hasBatteryOperatingPermit = getBatteryStatus(
                batteryStatus
            );
            generateCertificate(
                i,
                columnList[i].isDoorsTestPass,
                columnList[i].isBrakesTestPass,
                columnList[i].isCableTestPass,
                columnList[i].hasBatteryOperatingPermit
            );
        }
    }

    function isProductAproved(uint256 _numberOfColumns) public returns (bool) {
        for (uint256 i = 0; i < _numberOfColumns; i++) {
            p.isAproved = true;
            if (columnList[i].hasColumnCertificateOfConformity != true) {
                p.isAproved = false;
            }
        }
        return p.isAproved;
    }

    //https://medium.com/better-programming/how-to-test-ethereum-smart-contracts-35abc8fa199d
    //https://medium.com/@yangnana11/solidity-function-types-4ad4e5de6d56
}
