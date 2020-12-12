pragma solidity >=0.4.22 <0.8.0;

contract ProjectOffice {
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
}