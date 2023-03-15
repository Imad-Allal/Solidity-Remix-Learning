//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract TransactionWallet{

    struct Transaction{
        uint amount;
        uint timestamp;
    }

    struct Balance{
        uint totalBalance;
        uint numDeposit;
        mapping(uint => Transaction) deposits; //Give the num of the deposit and get de deposit details
        uint numWithdrawal;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function getDepositInfos(uint _numDeposit, address _from) public view returns(Transaction memory){
        return balances[_from].deposits[_numDeposit];
    }

    function depositMoney() public payable{
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposit] = deposit;
        balances[msg.sender].numDeposit++;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        balances[msg.sender].totalBalance -= _amount;
        
        Transaction memory withdrawl = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawal] = withdrawl;
        balances[msg.sender].numWithdrawal++;

        _to.transfer(_amount);
    }
}