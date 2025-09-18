// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2;

import {Test, console2} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {console2 as console} from "forge-std/console2.sol";

abstract contract ForkBaseTest is Test {
    string constant ABS_TESTNET = "abs_testnet";

    mapping(string => uint256) internal _forkIds;

    function _createSelectFork(string memory name) internal returns (uint256) {
        uint256 forkId = vm.createSelectFork(vm.rpcUrl(name));
        _forkIds[name] = forkId;
        _assertForkIsActive(forkId);
        return forkId;
    }

    function _selectFork(string memory name) internal {
        uint256 forkId = _forkIds[name];
        require(forkId != 0, "!forkId");
        vm.selectFork(forkId);
        _assertForkIsActive(forkId);
    }

    function _assertForkIsActive(uint256 forkId) internal {
        assertEq(vm.activeFork(), forkId, "!forkId");
    }
}
