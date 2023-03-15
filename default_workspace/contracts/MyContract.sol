//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract MyContract{

    string public ourString = "Hello World!";


    function updateString(string memory _updatedString) public {
        ourString = _updatedString;
    }
}