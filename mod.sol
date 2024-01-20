// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataManagement {
    address public admin;
    uint256 public data;

    event DataUpdated(uint256 newData);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not the admin");
        _;
    }

    constructor() {
        admin = msg.sender;
        data = 1000;
    }

    function updateData(uint256 newData, address targetAddress) external onlyAdmin {
        require(newData > data, "New data must be greater than the current data");
        assert(admin == targetAddress);
        require(newData % 10 == 0, "Data must be a multiple of 10");
        data = newData;
        emit DataUpdated(newData);
    }

    function revertIfDataExceedsLimit(uint256 newData) internal pure {
        if (newData > 10000) {
            revert("Data exceeds the limit");
        }
    }
}
