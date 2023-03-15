//SPDX-License-Identifier:MIT

pragma solidity 0.8.19;

contract SmartWithdrawMapping{

    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney(address payable _to) public{
        uint balance = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balance);
    }

    function getMyMoneyBack() public{
        address payable myAddress = payable(msg.sender);
        uint balance = balanceReceived[myAddress];
        balanceReceived[myAddress] = 0;
        myAddress.transfer(balance);
    }

    function getMyBalance() public view returns(uint) {
        return balanceReceived[msg.sender];
    }

}