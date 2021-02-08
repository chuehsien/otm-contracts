// SPDX-License-Identifier: --🦉--

pragma solidity =0.7.6;

import "./Declaration.sol";

abstract contract Timing is Declaration {

    function currentOtmDay() public view returns (uint64) {
        return _getNow() >= LAUNCH_TIME ? _currentOtmDay() : 0;
    }

    function _currentOtmDay() internal view returns (uint64) {
        return _otmDayFromStamp(_getNow());
    }

    function _nextOtmDay() internal view returns (uint64) {
        return _currentOtmDay() + 1;
    }

    function _previousOtmDay() internal view returns (uint64) {
        return _currentOtmDay() - 1;
    }

    function _otmDayFromStamp(uint256 _timestamp) internal view returns (uint64) {
        return uint64((_timestamp - LAUNCH_TIME) / SECONDS_IN_DAY);
    }

    function _getNow() internal view returns (uint256) {
        return block.timestamp;
    }
}