// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract BlockchainMsgSender{

    uint8 public changeCount;

    address public owner;

    string public message;


    constructor(){
        owner = msg.sender;
    }

    function changeMessage(string memory _newMessage) public{
        
        if(owner == msg.sender){
            message = _newMessage;
            changeCount++;
        }
    }

}