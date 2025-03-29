// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";


contract StakingContract is Ownable {

// State variables

address public stakingToken_;
uint256 public stakingPeriod_;
uint256 public fixedStakingAmount_;
uint256 public feePerAmount_;


mapping(address => uint256) public userBalances;
mapping(address => uint256) public deposiTime;

// Events

event ChangeStakingPeriod(uint256 newStakingPeriod);
event deposit(address addressDepositer , uint256 tokenAmountToDeposit_);
event withdrawevent(address addressWithdrawer , uint256 tokenAmountToWitdraw_);
event rewardevent(address addressWithdrawer , uint256 tokenAmountToWitdraw_);
event received(address sender, uint256 amount);

constructor ( uint256 feePerAmount ,uint256 fixedStakingAmount , address stakingToken, uint256 stakingPeriod ,address initialOwner) Ownable(initialOwner) {
    stakingToken_ = stakingToken;
    stakingPeriod_ = stakingPeriod;
    fixedStakingAmount_ = fixedStakingAmount;
    feePerAmount_ = feePerAmount;

}


// External functions

// Funtion to withdraw tokens

function withdrawTokens(uint256 tokenAmountToWithdraw_) external {
    // Obligations
    
    require(userBalances[msg.sender] >= 0, "You do not have enough tokens to withdraw");


// user balance updating

userBalances[msg.sender] -= tokenAmountToWithdraw_;

// Transfer the tokens from the contract to the user
    // This is the effect part of the CEI pattern

    IERC20(stakingToken_).transfer(msg.sender, tokenAmountToWithdraw_);
    
    
    
    // Emit an event for the withdrawal
    
    emit withdrawevent(msg.sender, tokenAmountToWithdraw_);
}


// Claim Rewards function

function claimRewards() external {
    // Check if the user has staked tokens
    require(userBalances[msg.sender] > 0, "You have no staked tokens to claim rewards from");
         
         uint256 elapsedPeriod = block.timestamp - deposiTime[msg.sender];
         require(elapsedPeriod >= stakingPeriod_, "You need to wait for the staking period to end before claiming rewards");

// Update state

    deposiTime[msg.sender] = block.timestamp;
// Transfer rewards
 (bool success, ) = msg.sender.call{value: feePerAmount_}("");
    require(success, "Failed to transfer rewards");


}


// feed contract by owner

receive() external payable onlyOwner(){
    // This function is called when the contract receives Ether
    // You can add any logic here if needed
    emit received(msg.sender, msg.value);
}




// Deposit function to stake tokens
// CEI PATTERN
// Check, Effect, Interact pattern

function Deposit(uint256 tokenAmountToDeposit_ ) external {
    require(tokenAmountToDeposit_ > 0, "You need to deposit at least some tokens");

    //Balance check

    userBalances[msg.sender] += tokenAmountToDeposit_;
    require(userBalances[msg.sender] <= IERC20(stakingToken_).balanceOf(msg.sender), "You do not have enough tokens to deposit");
    require( userBalances[msg.sender] <= fixedStakingAmount_, "You can only deposit a fixed amount of tokens");
    deposiTime[msg.sender] = block.timestamp;

    // Transfer the tokens from the user to the contract
    IERC20(stakingToken_).transferFrom(msg.sender, address(this), tokenAmountToDeposit_);
    // Emit an event for the deposit
    emit deposit(msg.sender, tokenAmountToDeposit_);


}







function setStakingPeriond(uint256 newStakingPeriod) external onlyOwner {
    stakingPeriod_ = newStakingPeriod;
    emit ChangeStakingPeriod(newStakingPeriod);

}




// Internal functions





}