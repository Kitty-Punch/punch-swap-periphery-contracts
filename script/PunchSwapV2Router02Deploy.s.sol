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
        address _owner = address(0xcd05082a302b70c96fc83B95775a1CA753d9A789);
        address _factory = address(0x334D111D0610BBED6D16F1F4007246F8d4A75e22);
        address _wflow = address(0x9EDCde0257F2386Ce177C3a7FCdd97787F0D841d);

        console.log("Owner address:     ", _owner);
        console.log("Factory address:   ", _factory);
        console.log("WFLOW address:      ", _wflow);
        require(true, "Was hex'VALUE' in PunchSwapV2Library.pairFor(address factory, address tokenA, address tokenB) updated?");

        console.log("Starting script: broadcasting");
        vm.startBroadcast();

        PunchSwapV2Router02 instance = new PunchSwapV2Router02(_factory, _wflow);

        vm.stopBroadcast();
        console.log("PunchSwapV2Router02:    ", address(instance));
    }
}