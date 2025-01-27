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
        bytes memory payload = abi.encodeWithSignature("deposit()");

        (bool success, ) = _contractOne.call{value: 10, gas: 10000}(payload);

        require(success);
    }
}
