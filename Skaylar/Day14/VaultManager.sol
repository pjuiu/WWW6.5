// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BasicDepositBox.sol";
import "./PremiumDepositBox.sol";
import "./TimeLockedDepositBox.sol";

contract VaultManager {

    mapping(address => address[]) public userVaults;

    event VaultCreated(address owner,address vault);

    function createBasicVault() public {

        BasicDepositBox vault =
        new BasicDepositBox(msg.sender);

        userVaults[msg.sender].push(address(vault));

        emit VaultCreated(msg.sender,address(vault));

    }

    function createPremiumVault() public {

        PremiumDepositBox vault =
        new PremiumDepositBox(msg.sender);

        userVaults[msg.sender].push(address(vault));

        emit VaultCreated(msg.sender,address(vault));

    }

    function createTimeLockedVault(uint256 lockDuration) public {

        TimeLockedDepositBox vault =
        new TimeLockedDepositBox(msg.sender,lockDuration);

        userVaults[msg.sender].push(address(vault));

        emit VaultCreated(msg.sender,address(vault));

    }

    function getMyVaults() public view returns(address[] memory){

        return userVaults[msg.sender];

    }

}