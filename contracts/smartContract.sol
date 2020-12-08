pragma solidity >=0.4.22 <0.8.0;

contract SmartContracts {
    //test
    bool column;
    bool doors;
    bool brakes;
    bool cable;

    struct product {

        string client;
        string name;
        string component;
        uint doorsNumber;
        uint columnNumber;
        
        bool verified;
        uint quantity;
        uint64 price;
        
        uint certificate_of_conformity_unit;
        uint [] certificate_of_conformity_list;
        string battery_operating_permit;


    }
    
        
    //function that will return true if the test passes
    function columnStatus(bool status) public {
        column = status;
    }
    function doorsStatus(bool status) public {
        doors = status;
    }
    function brakeStatus(bool status) public {
        brakes = status;
    }
    function cableStatus(bool status) public {
        cable = status;
    }



    

//https://medium.com/@yangnana11/solidity-function-types-4ad4e5de6d56
 

    
}

