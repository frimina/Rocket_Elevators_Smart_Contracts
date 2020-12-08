pragma solidity >=0.4.22 <0.8.0;

contract SmartContracts {
    //test
    bool column;
    bool doors;
    bool brakes;
    bool cable;
    bool battery_operating_permit;
    uint [] certificate_of_conformity_list;

    struct Product {

        string client;
        string name;
        string component;
        bool verified;
        uint quantity;
        uint64 price;
        uint columnNumber;
        uint certificate_of_conformity_unit;       
    }  

    Product new_prod;  
        
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
    function batteryStatus(bool battery_permit) public {
        battery_operating_permit = battery_permit; 
    }

    function generateCertificate(bool column_status, bool doors_status, bool brakes_status, bool battery_operating_permit_status) public {
        if (column_status == true && doors_status == true && brakes_status == true && battery_operating_permit_status == true)
        {
            certificate_of_conformity_list.push();
        }
    }  





}