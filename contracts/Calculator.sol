// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Calculator is Ownable(msg.sender) {
    uint256 public lastAdditionResult;
    uint256 public lastSubtractionResult;
    uint256 public lastMultiplicationResult;
    uint256 public lastDivisionResult;

    function add(uint256 a, uint256 b) public onlyOwner {
        lastAdditionResult = a + b ;
    }

    function subtract(uint256 a, uint256 b) public onlyOwner {
        lastSubtractionResult = a - b;
    }

    function multiply(uint256 a, uint256 b) public onlyOwner {
        lastMultiplicationResult = a * b ;
    }

    function divide(uint256 a, uint256 b) public onlyOwner {
        require(b != 0, "Cannot divide by zero");
        lastDivisionResult = a / b ;
    }

    function getLastAdditionResult() public view returns (uint256) {
        return lastAdditionResult;
    }

    function getLastSubtractionResult() public view returns (uint256) {
        return lastSubtractionResult;
    }

    function getLastMultiplicationResult() public view returns (uint256) {
        return lastMultiplicationResult;
    }

    function getLastDivisionResult() public view returns (uint256) {
        return lastDivisionResult;
    }
}
