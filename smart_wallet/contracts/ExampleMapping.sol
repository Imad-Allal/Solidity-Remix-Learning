//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract ExampleMapping{
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) public uintUintBoolMapping;

    function setValue(uint _index) public{
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function uintUintBool(uint _key1, uint _key2) public{
        uintUintBoolMapping[_key1][_key2] = true;
    }
}