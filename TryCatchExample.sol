//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract WillThrow {
    function aFunction() public pure {
        require(false, "Error message");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            //here we could do something if it works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}
