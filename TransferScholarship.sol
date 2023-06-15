// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import './Register.sol';
import './division.sol';
import './MakeDonation.sol';


contract TransferScholarship is Register, Division, MakeDonation{

    address[] studentAddress = new address[](0);

    function compareStrings(string memory str1, string memory str2) public payable returns (bool) {
    return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
}
    function addAddress() public payable {
     
         for(uint256 i=0;i<donors.length;i++){
        if(compareStrings(donors[i].role,'student') || compareStrings(donors[i].role,'Student')){
            studentAddress.push(payable(donors[i].myAddress));
        }

    }

    }
   

    function Transfer() public payable {
      
        for(uint256 i=0;i<studentAddress.length;i++){
           
            sendViaCall(studentAddress[i]);
        }
        

    }


    
   
    
}



