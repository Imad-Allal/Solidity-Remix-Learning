//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleContract{

    string public myString = "Hello World";

    function updateString(string memory _myString) public payable {
        //payable means that we can send a value in the SC
        if(msg.value == 1 ether){
            myString = _myString;
            //msg.value is the value the sender sends in the smart contract
            //ether is is a unity
        }

        else{
            payable(msg.sender).transfer(msg.value);
            //msg.sender.transfer(msg.value): we transfer the value sent to the account with the address of msg.sender
            //Hence, we need to cast the address of the account/SC (msg.sender) the the "payable" type
        }

        //In this function, if the value sent == 1 ether than we update myString, else, we sent back the value to the sender
    }


}