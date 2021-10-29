pragma solidity 0.5.17;

import "./TranquilStakingProxyStorage.sol";


contract TranquilStakingStorage is TranquilStakingProxyStorage {
    uint constant nofStakingRewards = 2;
    uint constant REWARD_TRANQ = 0;
    uint constant REWARD_ONE = 1;

    // Address of the staked token.
    address public stakedTokenAddress;

    // Addresses of the ERC20 reward tokens
    mapping(uint => address) public rewardTokenAddresses;

    // Reward accrual speeds per reward token as tokens per second
    mapping(uint => uint) public rewardSpeeds;

    // Unclaimed staking rewards per user and token
    mapping(address => mapping(uint => uint)) public accruedReward;

    // Supplied tokens at stake per user
    mapping(address => uint) public supplyAmount;

    // Sum of all supplied tokens at stake
    uint public totalSupplies;

    mapping(uint => uint) public rewardIndex;
    mapping(address => mapping(uint => uint)) public supplierRewardIndex;
    uint public accrualBlockTimestamp;
}
