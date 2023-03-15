//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ReceiveFallback{

    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public value;

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "received";
    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

    function setValue(uint _value) public {
        value = _value;
        lastFunctionCalled = "setValue";
    }
    //Input of the function: 0x552410770000000000000000000000000000000000000000000000000000000000000005
    //The 4 first bytes (First 8 hex characters) are the function signature.
    //If we pass the input of the function into the CALLDATA field than the function will automatically be executed
}