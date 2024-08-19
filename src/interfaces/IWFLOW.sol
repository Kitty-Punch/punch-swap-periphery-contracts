// SPDX-License-Identifier: MIT
pragma solidity >0.6.2;

import "./IERC20.sol";

interface IWFLOW is IERC20 {
    event Deposit(address indexed dst, uint wad);
    event Withdrawal(address indexed src, uint wad);

    function deposit() external payable;

    function withdraw(uint) external;
}
