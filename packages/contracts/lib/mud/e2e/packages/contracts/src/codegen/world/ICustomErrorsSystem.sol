// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

import { Position } from "./../../CustomTypes.sol";

/**
 * @title ICustomErrorsSystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface ICustomErrorsSystem {
  error TestError1();
  error TestError2(Position position, uint256 value, string name, bool flag);

  function stub(uint256 arg) external pure returns (uint256);
}
