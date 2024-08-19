pragma solidity >=0.6.2;

interface IPunchSwapV2Migrator {
    function migrate(address token, uint amountTokenMin, uint amountETHMin, address to, uint deadline) external;
}
