pragma solidity 0.5.17;

contract ComptrollerInterface {
    /// @notice Indicator that this is a Comptroller contract (for inspection)
    bool public constant isComptroller = true;

    /*** Assets You Are In ***/

    function enterMarkets(address[] calldata tqTokens) external returns (uint[] memory);
    function exitMarket(address tqToken) external returns (uint);

    /*** Policy Hooks ***/

    function mintAllowed(address tqToken, address minter, uint mintAmount) external returns (uint);
    function mintVerify(address tqToken, address minter, uint mintAmount, uint mintTokens) external;

    function redeemAllowed(address tqToken, address redeemer, uint redeemTokens) external returns (uint);
    function redeemVerify(address tqToken, address redeemer, uint redeemAmount, uint redeemTokens) external;

    function borrowAllowed(address tqToken, address borrower, uint borrowAmount) external returns (uint);
    function borrowVerify(address tqToken, address borrower, uint borrowAmount) external;

    function repayBorrowAllowed(
        address tqToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function repayBorrowVerify(
        address tqToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function liquidateBorrowAllowed(
        address tqTokenBorrowed,
        address tqTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function liquidateBorrowVerify(
        address tqTokenBorrowed,
        address tqTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function seizeAllowed(
        address tqTokenCollateral,
        address tqTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function seizeVerify(
        address tqTokenCollateral,
        address tqTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function transferAllowed(address tqToken, address src, address dst, uint transferTokens) external returns (uint);
    function transferVerify(address tqToken, address src, address dst, uint transferTokens) external;

    /*** Liquidity/Liquidation Calculations ***/

    function liquidateCalculateSeizeTokens(
        address tqTokenBorrowed,
        address tqTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}
