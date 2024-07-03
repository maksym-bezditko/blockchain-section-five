//SPDX-License-Identifier: MIT

pragma 0.8.15;

contract ContractOne {
	mapping (address => uint) public addressBalance;
	
	function deposit() public payable {
		addressBalance[msg.sender] += msg.value;
	}
	
	receive() external payable {
		deposit()
	}
}

contract ContractTwo {
	receive() external payable {}
	
	function depositOnContractOne(address _contractOne) public {
		// the call will hit the fallback function
		(bool success, ) = _contractOne.call{ value: 10, gas: 100000 }("");
		
		require(success);
	}
}