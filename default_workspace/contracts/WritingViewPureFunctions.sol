// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract WritingViewPureFunctions{

    uint public myStorageVariable;

    //Writing function:
    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }
    //A writing function can have return variables, but they won't actually return anything to the transaction initializer. There are several reason for it, but the most prominent one is: at the time of sending the transaction the actual state is unknown. It is possible that someone sends a competing transaction that alters the state and from there it only depends on the transaction ordering - which is something that happens on the miner side. You will see that extensively in the next section.
    //What's the return variable for then?
    //It's for Smart Contract communication. It is used to return something when a smart contract calls another smart contract function.
    //How to return variables then in Solidity? With Events! Something we're talking about later on.


    //View function:
    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }
    //A view function is a function that reads from the state but doesn't write to the state. A classic view function would be a getter-function. Let's extend the smart contract and write one:


    //Pure function:
    function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
    //A pure function is a function that neither writes, nor reads from state variables. It can only access its own arguments and other pure functions. Let me give you an example:
    
}