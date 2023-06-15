// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import './Register.sol';

contract MakeDonation is Register{
    mapping (address => uint256) balanceOf;

        function donate(uint256 id, uint256 amount) public payable returns(bool){
            require(msg.sender!=owner);
            sendViaCall(owner);
            // owner.transfer(amount);
            balanceOf[owner] += amount;
            return true;
        }

        
        function sendViaCall(address  _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

}

