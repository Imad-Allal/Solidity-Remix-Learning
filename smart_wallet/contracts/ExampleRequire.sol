//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


contract ExampleRequire{

    mapping (address => uint) public balanceReceived;

    function receiveMoney() public payable{
        balanceReceived[msg.sender] = msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        //if(_amount >= balanceReceived[msg.sender]){
        require(_amount >= balanceReceived[msg.sender], "Insuficient funds");  
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        //}
    }

}