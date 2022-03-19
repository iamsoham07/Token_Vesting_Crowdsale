// SPDX-License-Identifier: MIT
pragma solidity >0.4.0<=0.9.0;

import "./TokenVesting.sol";

/**
 * @title MockTokenVesting
 * WARNING: use only for testing and debugging purpose
 */
contract MockTokenVesting is TokenVesting{

    uint256 mockTime = 0;

    constructor(address token_) TokenVesting(token_){
    }

    function setCurrentTime(uint256 _time)
        external{
        mockTime = _time;
    }

    function getCurrentTime()
        internal
        virtual
        view
        returns(uint256){
        return mockTime;
    }
}