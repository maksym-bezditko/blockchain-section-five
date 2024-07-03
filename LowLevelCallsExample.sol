// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Sender {
	receive() external payable {}
	
	function withdrawTransfer(address payable _to) public {
		_to.transfer(10);
	}
	
	function withdrawSend(address payable _to) public {
		bool isSent = _to.send(10);
		
		require(isSent, "The transaction didn't go through!")
	}
}

contract ReceiverNoAction {
	function balance() public view returns(unit) {
		return address(this).balance;
	}

	receive() external payable {}
}

contract ReceiverAction {
	unit public balanceReceived;

	function balance() public view returns(unit) {
		return address(this).balance;
	}

	receive() external payable {
		balanceReceived += msg.value;
	}
	
	// requires gas, if we interact with the deployed ReceiverAction contract,
	// the transaction will not go through, but
	// transfer in this case will throw an error
	// and send in this case will return false
	
	// send and transfer are both providing 2300 gas
}