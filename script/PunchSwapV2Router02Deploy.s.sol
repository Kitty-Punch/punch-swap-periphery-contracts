// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2;

import "forge-std/Script.sol";
import {Consts} from "./Consts.sol";
import {PunchSwapV2Router02} from "../src/PunchSwapV2Router02.sol";


/*
    forge script ./script/PunchSwapV2Router02Deploy.s.sol:PunchSwapV2Router02DeployScript --rpc-url <your-rpc-url> -vvv --broadcast

    --broadcast to send the tx to the network
    -vvv to see the logs
*/
contract PunchSwapV2Router02DeployScript is Script, Consts {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint(PARAM_PK_ACCOUNT);
        address _owner = vm.envAddress(PARAM_OWNER);
        address _factory = address(0x0);
        address _wflow = address(0x0);

        console.log("Owner address:     ", _owner);
        console.log("Factory address:   ", _factory);
        console.log("WFLOW address:      ", _wflow);
        require(false, "Was hex'VALUE' in PunchSwapV2Library.pairFor(address factory, address tokenA, address tokenB) updated?");

        console.log("Starting script: broadcasting");
        vm.startBroadcast(deployerPrivateKey);

        PunchSwapV2Router02 instance = new PunchSwapV2Router02(_factory, _wflow);

        vm.stopBroadcast();
        console.log("PunchSwapV2Router02:    ", address(instance));
    }
}