// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Register {
     string name;
    uint256 contact;
    string email;
    string addressofOrg;  
    address owner; 

    struct Donor{
    string name;
    uint256 contact;
    string email;
    string addressofOrg; 
    address myAddress; 

    }

    Donor[] donors;


    // constructor(string memory _name, uint256 _contact, string memory _email, string memory _addressofOrg){
    //     name = _name;
    //     contact = _contact;
    //     email = _email;
    //     addressofOrg = _addressofOrg;

     
       
    // }

    function registerMe(string memory _name, uint256 _contact, string memory _email, string memory _addressofOrg) public returns(bool){
             require(msg.sender!=owner,'Owner cannor register');
              donors.push(Donor(_name,_contact,_email,_addressofOrg,msg.sender));
              return true;
    }

    function seeDonors() public view returns (Donor[] memory){
        require(msg.sender==owner,'Only owner can see all donors information');
        return donors;
    }
}