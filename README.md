## Overview
This repository contains a collection of Solidity contracts demonstrating various features of the Solidity programming language. Each contract is designed to illustrate specific concepts or functionalities within Ethereum smart contracts, such as handling exceptions, low-level calls, mappings, and struct usage.

## Contracts

### 1. AssertExample.sol
**Description:** Demonstrates the use of `assert` statements in Solidity to catch errors and invariants.
- **State Variables:**
  - `mapping(address => uint8) public balanceReceived`: Tracks the balance received by each address.
- **Functions:**
  - `receiveMoney() public payable`: Receives Ether and updates the balance with assertions to ensure correct value and balance updates.
  - `withdrawMoney(address payable _to, uint8 _amount) public`: Withdraws the specified amount of Ether to the given address, using `require` and `assert` to ensure balance validity.

### 2. LowLevelCallsExample.sol
**Description:** Demonstrates the use of low-level calls (`send` and `transfer`) in Solidity.
- **Contracts:**
  - `Sender`: Sends Ether using `transfer` and `send` methods.
  - `ReceiverNoAction`: Receives Ether with no additional action.
  - `ReceiverAction`: Receives Ether and updates a balance, requiring gas.

### 3. LowLevelCallsKnownTargetExample.sol
**Description:** Demonstrates low-level calls to a known target contract.
- **Contracts:**
  - `ContractOne`: Accepts deposits and tracks balances.
  - `ContractTwo`: Makes a low-level call to `ContractOne` to deposit Ether with customized gas and value.

### 4. LowLevelCallsUnknownTargetExample.sol
**Description:** Demonstrates low-level calls to an unknown target contract using `abi.encodeWithSignature`.
- **Contracts:**
  - `ContractOne`: Accepts deposits and tracks balances.
  - `ContractTwo`: Makes a low-level call to `ContractOne` using encoded payload.

### 5. LowLevelCallsUnknownTargetNoPayloadExample.sol
**Description:** Demonstrates low-level calls to an unknown target contract without a payload.
- **Contracts:**
  - `ContractOne`: Accepts deposits and tracks balances, including a fallback function.
  - `ContractTwo`: Makes a low-level call to `ContractOne`'s fallback function.

### 6. MappingExample.sol
**Description:** Demonstrates the use of mappings in Solidity to track balances.
- **State Variables:**
  - `mapping(address => uint) public balanceReceived`: Tracks the balance received by each address.
- **Functions:**
  - `getBalance() public view returns(uint)`: Returns the contract's balance.
  - `sendMoney() public payable`: Sends Ether to the contract and updates the balance.
  - `withdrawMoney(address payable _to, uint _amount) public`: Withdraws a specified amount of Ether.
  - `withdrawAllMoney(address payable _to) public`: Withdraws the full balance of the sender.

### 7. MappingStructExample.sol
**Description:** Demonstrates the use of mappings and structs to track detailed transaction information.
- **Structs:**
  - `Transaction`: Stores transaction details (amount and timestamp).
  - `Balance`: Tracks deposits, withdrawals, and total balance for an address.
- **State Variables:**
  - `mapping(address => Balance) balanceReceived`: Tracks balances and transactions for each address.
- **Functions:**
  - `getBalance(address _address) public view returns (uint256)`: Returns the total balance for an address.
  - `depositMoney() public payable`: Deposits Ether and records the transaction.
  - `withdrawMoney(address payable _address, uint256 amount) public`: Withdraws Ether and records the transaction.

### 8. RequireExample.sol
**Description:** Demonstrates the use of `require` statements to enforce conditions.
- **State Variables:**
  - `mapping(address => uint) public balanceReceived`: Tracks the balance received by each address.
- **Functions:**
  - `receiveMoney() public payable`: Receives Ether and updates the balance.
  - `withdrawMoney(address payable _to, uint _amount) public`: Withdraws the specified amount of Ether to the given address, using `require` to enforce balance checks.

### 9. StructExample1.sol
**Description:** Demonstrates the use of constructors and struct instances.
- **Contracts:**
  - `PaymentReceived`: Stores payment information.
  - `Wallet`: Creates instances of `PaymentReceived` when Ether is sent.

### 10. StructExample2.sol
**Description:** Demonstrates the use of structs within the same contract.
- **Contracts:**
  - `Wallet2`: Uses a struct to store payment information and updates it when Ether is sent.

### 11. TryCatchExample.sol
**Description:** Demonstrates the use of `try/catch` for error handling in Solidity.
- **Contracts:**
  - `WillThrow`: Contains a function that always throws an error.
  - `ErrorHandling`: Tries to call a function in `WillThrow` and catches the error, emitting an event with the error message.

## Usage
1. **Compilation:** Use a Solidity compiler (solc) to compile the contracts.
2. **Deployment:** Deploy the contracts using tools like Remix, Truffle, or Hardhat.
3. **Interaction:** Interact with the deployed contracts via web3.js, ethers.js, or directly through the Remix IDE.

## License
All contracts in this repository are licensed under the MIT License.