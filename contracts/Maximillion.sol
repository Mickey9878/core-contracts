pragma solidity 0.5.17;

import "./TqOne.sol";

/**
 * @title Tranquil's Maximillion Contract
 * @author Tranquil
 */
contract Maximillion {
    /**
     * @notice The default tqOne market to repay in
     */
    TqOne public tqOne;

    /**
     * @notice Construct a Maximillion to repay max in a TqOne market
     */
    constructor(TqOne tqOne_) public {
        tqOne = tqOne_;
    }

    /**
     * @notice msg.sender sends ONE to repay an account's borrow in the tqOne market
     * @dev The provided ONE is applied towards the borrow balance, any excess is refunded
     * @param borrower The address of the borrower account to repay on behalf of
     */
    function repayBehalf(address borrower) public payable {
        repayBehalfExplicit(borrower, tqOne);
    }

    /**
     * @notice msg.sender sends ONE to repay an account's borrow in a tqOne market
     * @dev The provided ONE is applied towards the borrow balance, any excess is refunded
     * @param borrower The address of the borrower account to repay on behalf of
     * @param tqOne_ The address of the tqOne contract to repay in
     */
    function repayBehalfExplicit(address borrower, TqOne tqOne_) public payable {
        uint received = msg.value;
        uint borrows = tqOne_.borrowBalanceCurrent(borrower);
        if (received > borrows) {
            tqOne_.repayBorrowBehalf.value(borrows)(borrower);
            msg.sender.transfer(received - borrows);
        } else {
            tqOne_.repayBorrowBehalf.value(received)(borrower);
        }
    }
}
