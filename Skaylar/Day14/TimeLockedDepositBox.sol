// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BaseDepositBox.sol";

contract TimeLockedDepositBox is BaseDepositBox {

    uint256 public unlockTime;

    modifier onlyAfterUnlock() {

        require(block.timestamp >= unlockTime,"Vault still locked");

        _;
    }

    constructor(address _owner,uint256 _lockDuration)
    BaseDepositBox(_owner)
    {

        unlockTime = block.timestamp + _lockDuration;

    }

    function getSecret()
    public
    view
    override
    onlyAfterUnlock
    returns(string memory){

        return secret;

    }

}