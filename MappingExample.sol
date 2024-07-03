//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract MappingsExample {
	mapping(address => uint) public balanceReceived;
	
	function getBalance() public view returns(uint) {
		// returning smart contract balance
		return address(this).balance;
	}
	
	function sendMoney() public payable {
		// sending money to the smart contract
		balanceReceived[msg.sender] += msg.value;
	}
	
	function withdrawMoney(address payable _to, uint _amount) public {
		// withdraw some amount
		require(balanceReceived[_to] >= _amount, "Not enough funds");
		balanceReceived[_to] -= _amount;
		_to.transfer(_amount);
	}
	
	function withdrawAllMoney(address payable _to) public {
		// withdraw full balance
		uint balanceToSend = balanceReceived[msg.sender];
		balanceReceived[msg.sender] = 0;
		_to.transfer(balanceToSend);
	}
}