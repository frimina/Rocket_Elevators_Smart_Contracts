pragma solidity >=0.4.22 <0.8.0;

contract SmartContracts {
    struct product { // Struct
        string name;
        string component;
        bool verified;
        uint64 quantity;
        uint64 price
        
    }


    struct CertificatesAndPermits{
        string certificates;
        string permits;
    }



    struct authentificate { // Struct
        string name;
        bool verified;
        uint64 quantity;
        
    }


     struct test { // Struct
        string name;
        bool verified;
        uint64 quantity;
        
    }
}

