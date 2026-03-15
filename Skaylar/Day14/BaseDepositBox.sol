// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDepositBox {

    function depositSecret(string memory _secret) external;

    function getSecret() external view returns(string memory);

    function getOwner() external view returns(address);

    function transferOwnership(address _newOwner) external;

}
