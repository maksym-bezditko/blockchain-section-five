//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract MappingsStructExample {
    struct Transaction {
        uint256 amount;
        uint256 timestamp;
    }

    struct Balance {
        uint256 numDeposits;
        mapping(uint256 => Transaction) deposits;
        uint256 numWithdrawals;
        mapping(uint256 => Transaction) withdrawals;
        uint256 totalBalance;
    }

    mapping(address => Balance) balanceReceived;

    function getBalance(address _address) public view returns (uint256) {
        return balanceReceived[_address].totalBalance;
    }

    function depositMoney() public payable {
        require(msg.value > 0, "Value can't be zero");

        Balance storage userBalance = balanceReceived[msg.sender];

        userBalance.totalBalance += msg.value;

        userBalance.deposits[userBalance.numDeposits] = Transaction(
            msg.value,
            block.timestamp
        );

        userBalance.numDeposits++;
    }

    function withdrawMoney(address payable _address, uint256 amount) public {
        require(amount > 0, "Amount can't be zero");

        Balance storage userBalance = balanceReceived[msg.sender];

        userBalance.totalBalance -= amount;

        userBalance.withdrawals[userBalance.numWithdrawals] = Transaction(
            amount,
            block.timestamp
        );

        userBalance.numWithdrawals++;

        _address.transfer(amount);
    }
}
