// SPDX-License-Identifier: MIT
 
 pragma solidity ^0.8.19;

 import {Test, console} from "forge-std/Test.sol";
 import {FundMe} from "../../src/FundMe.sol";
 import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
 import {FundFundMe,WithdrawFundMe} from "../../script/Interactions.s.sol";        

 contract InteractionsTest is Test{
    FundMe fundMe;

    function setUp() external {
         DeployFundMe deployFundMe = new DeployFundMe();
         fundMe = deployFundMe.run();
    }

    function testUserCanFundInteractions() public{
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));

        WithdrawFundMe withDrawFundMe = new WithdrawFundMe();
        withDrawFundMe.withdrawFundMe(address(fundMe));

        assert(address(fundMe).balance == 0);
    }
 }