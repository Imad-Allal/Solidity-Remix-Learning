//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.19;

contract SmartContractWallet{

    address payable public owner;

    mapping(address => bool) isAllowedToSend;
    mapping(address => uint) allowanceValue;

    mapping (address => bool) guardians;
    mapping (address => mapping (address => bool)) guardiansVotingForOwners;

    address payable public nextOwner;

    mapping(address => uint) gardiansResetCount;
    uint constant gardiansVotingCount = 3;

    constructor(){
        owner = payable(msg.sender);
        //The owner is the one who deployed the contract
    }

    function setGardians(address _newGardianAddress, bool _isGardian) public{
        require(msg.sender == owner, "You're not the owner, aborting");
        guardians[_newGardianAddress] = _isGardian;
    }

    function setNewOwner(address payable _newOwner) public{
        require(guardians[msg.sender], "You're not a guardian, aborting");
        require(guardiansVotingForOwners[_newOwner][msg.sender] == false, "You've already voted for this to be the owner!");

        if(_newOwner != nextOwner){
            nextOwner = _newOwner;
        }

        guardiansVotingForOwners[_newOwner][msg.sender] = true;
        gardiansResetCount[_newOwner]++;

        if(gardiansResetCount[_newOwner] >= gardiansVotingCount){
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public{
        require(msg.sender == owner, "You're not the owner, aborting");
        allowanceValue[msg.sender] = _amount;

        if(_amount > 0)
            isAllowedToSend[_for] = true;
        else
            isAllowedToSend[_for] = false;
    }

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){
        if(msg.sender != owner){
            require(isAllowedToSend[msg.sender], "You're not allowed to send values, aborting");
            
            require(allowanceValue[msg.sender] >= _amount, "The value you're about to send is too high, aborting");
            allowanceValue[msg.sender] -= _amount;
        }
        
        (bool success, bytes memory returnedData) = _to.call{value: _amount}(_payload);
        require(success, "The data couldn't be sent, aborting");
        return returnedData;
    }


}