// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2;

import {console2 as console} from "forge-std/console2.sol";
import {IPunchSwapV2Pair} from "../src/interfaces/core/IPunchSwapV2Pair.sol";
import {IPunchSwapV2Factory} from "../src/interfaces/core/IPunchSwapV2Factory.sol";
import {IERC20} from "../src/interfaces/IERC20.sol";
import {ForkBaseTest} from "./utils/ForkBase.t.sol";
import {PunchSwapV2Router02} from "../src/PunchSwapV2Router02.sol";

contract PunchSwapV2RouterAddLiquidityForkTest is ForkBaseTest {
    address public constant WETH = address(0x9EDCde0257F2386Ce177C3a7FCdd97787F0D841d);
    address public constant USDC = address(0xe4C7fBB0a626ed208021ccabA6Be1566905E2dFc);
    // address payable public constant V2_ROUTER = payable(address());
    address public constant V2_FACTORY = address(0x4b83c3cd51C6D48D7DCF191ad846C34025E2Bc65);
    uint256 public constant ONE_SHARE = 1e18;

    PunchSwapV2Router02 public v2Router;
    IPunchSwapV2Factory public v2Factory;

    function setUp() public {
        _createSelectFork(ABS_TESTNET);
        v2Router = new PunchSwapV2Router02(V2_FACTORY, WETH);
        v2Factory = IPunchSwapV2Factory(V2_FACTORY);

        vm.label(address(v2Router), "V2_ROUTER");
        vm.label(V2_FACTORY, "V2_FACTORY");
        vm.label(WETH, "WETH");
        vm.label(USDC, "USDC");

        assertEq(v2Router.WFLOW(), WETH, "!WFLOW");
        assertEq(v2Router.factory(), V2_FACTORY, "!factory");
    }

    function test_addLiquidity_valid() external {
        address _pair = v2Factory.getPair(WETH, USDC);

        address _user = makeAddr("user");
        uint256 _wethAmount = 10e18;
        uint256 _usdcAmount = 10e18;
        uint256 _deadline = block.timestamp + 100;
        deal(WETH, _user, _wethAmount);
        deal(USDC, _user, _usdcAmount);

        vm.startPrank(_user);
        IERC20(WETH).approve(address(v2Router), _wethAmount);
        IERC20(USDC).approve(address(v2Router), _usdcAmount);
        (uint256 amountA, uint256 amountB, uint256 liquidity) =
            v2Router.addLiquidity(WETH, USDC, _wethAmount, _usdcAmount, 0, 0, _user, _deadline);
        vm.stopPrank();

        console.log("amountA", amountA);
        console.log("amountB", amountB);
        console.log("liquidity", liquidity);
    }
}
