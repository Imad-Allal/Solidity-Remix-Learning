// SPDX-License-Identifier:MIT

pragma solidity 0.8.15;

contract ExampleMsgSender{
    address public someAddress;

    function updateSomeAddress() public {
        someAddress = msg.sender;
    }

    // The msg.sender contains the address of the person who is interracting with the smart contract
    // If a SC(1) is interracting with another SC(2), then the msg.sender would contain the address of the SC(1)
}