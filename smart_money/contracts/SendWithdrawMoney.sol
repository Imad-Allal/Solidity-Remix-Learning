//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SendWithdrawMoney {

    uint public sendedMoney;

    function sendMoney() public payable {
        sendedMoney += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
        //address(this): The address of the current account
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function withdrawTo(address payable to) public {
        to.transfer(getContractBalance());
    }
}