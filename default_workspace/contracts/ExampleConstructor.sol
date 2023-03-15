// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleConstructor{

    address public someAddress;

    constructor(address _someAddress){
        someAddress = _someAddress;
    }

    function getAddress() public view returns(address){
        return someAddress;
    }

    function setAddress() public{
        someAddress = msg.sender;
    }
}