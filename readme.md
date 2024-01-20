# Data Management Smart Contract

This Solidity smart contract manages data with an administrative control mechanism.

## Overview

The `DataManagement` contract allows an administrator to update a numerical data value, subject to certain conditions. The contract includes an event (`DataUpdated`) to track changes to the data.


## Contract Details

- **Admin:** The contract has an administrator, initially set to the deployer of the contract.
- **Data:** An unsigned integer variable (`data`) is used to store the numerical data.

## Functions

### `updateData(uint256 newData, address targetAddress)`

This function allows the administrator to update the data, subject to the following conditions:

- The caller must be the administrator.
- The new data must be greater than the current data.
- The administrator address must match the provided `targetAddress`.
- The new data must be a multiple of 10.

Emits a `DataUpdated` event upon successful data update.

### `revertIfDataExceedsLimit(uint256 newData)`

This internal pure function is used to revert the transaction if the provided new data exceeds a predefined limit of 10,000.

## Usage

1. Deploy the contract.
2. Interact with the contract using the `updateData` function to update the data.

## Example

```solidity
// Deploy the contract
DataManagement dataContract = new DataManagement();

// Update data (assuming sender is the admin)
dataContract.updateData(1010, msg.sender);
