// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ContractOne {
    mapping(address => uint) public addressBalance;

    function deposit() public payable {
        addressBalance[msg.sender] += msg.value;
    }
}

contract ContractTwo {
    receive() external payable {}

    function depositOnContractOne(address _contractOne) public {
        ContractOne one = ContractOne(_contractOne);

        // one.deposit();

        // with the low-level call we can customize gas and value
        one.deposit{value: 10, gas: 10000}();
    }
}
