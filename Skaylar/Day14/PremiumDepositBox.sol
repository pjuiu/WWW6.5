// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BaseDepositBox.sol";

contract PremiumDepositBox is BaseDepositBox {

    string public metadata;

    constructor(address _owner) BaseDepositBox(_owner) {}

    function setMetadata(string memory _metadata) public onlyOwner {

        metadata = _metadata;

    }

    function getMetadata() public view returns(string memory){

        return metadata;

    }

}