# Multi-Signature Wallet Contract

## Overview

This smart contract implements a decentralized **multi-signature wallet** where multiple authorized owners must approve a transaction before it can be executed. This ensures that transactions are secure and require consensus from a group of owners, rather than relying on a single individual. The contract supports a configurable **approval threshold**, meaning a minimum number of signatures must be obtained before a transaction is processed.

The contract also includes functionality for retrieving the list of authorized owners, adding or removing owners, and tracking the status of pending transactions.

## Features

- **Multi-Signature Transactions**: Requires multiple approvals from authorized owners before a transaction can be executed.
- **Transaction Tracking**: Allows tracking of the transaction ID, amount, recipient, and status (executed, canceled).
- **Owner Management**: Easily manage the list of owners with functionalities for adding and removing owners.
- **Threshold Configuration**: The number of signatures required to approve a transaction is configurable.

## Error Constants

The contract defines several error constants to handle various transaction scenarios:

- `ERR-NOT-AUTHORIZED`: Unauthorized access attempt.
- `ERR-ALREADY-EXECUTED`: Transaction has already been executed.
- `ERR-INVALID-THRESHOLD`: The threshold for transaction approvals is invalid.
- `ERR-DUPLICATE_SIGNATURE`: Signature already recorded for this transaction.
- `ERR-INSUFFICIENT_SIGNATURES`: Not enough signatures to execute the transaction.
- `ERR-INVALID_RECIPIENT`: Invalid recipient address.
- `ERR-INVALID_AMOUNT`: Invalid transaction amount.
- `ERR-TRANSFER_FAILED`: STX transfer failure.
- `ERR-TRANSACTION-NOT-PENDING`: The transaction cannot be canceled as it is not pending.
- `ERR-ALREADY-CANCELED`: Transaction has already been canceled.
- `ERR-OWNERS-LIST-FULL`: The maximum number of owners has been reached.

## Configuration

The contract stores configuration data including the **approval threshold** and the **current transaction ID**:

- `approval-threshold`: The minimum number of signatures required to approve a transaction. Initially set to 2.
- `current-transaction-id`: Tracks the next available transaction ID, starting from 0.

## Data Structures

### Authorized Owners

- **authorized-owners**: A map that stores the principal addresses of authorized owners and their approval status.

- **owners-list**: A list that maintains the order of owners, which also enables fetching a list of authorized owners.

### Transactions

- **transaction-records**: A map that stores transaction details for each transaction ID. Each transaction record includes:
  - `recipient`: The recipient's principal address.
  - `amount`: The amount to be transferred in the transaction.
  - `executed`: Boolean flag indicating whether the transaction has been executed.
  - `canceled`: Boolean flag indicating whether the transaction has been canceled.
  - `signatures-count`: The number of signatures obtained for the transaction.

- **transaction-signatures**: A map that tracks which owners have signed a transaction by recording the transaction ID and the owner’s principal address.

## Functions

### 1. **Add Owner**

Adds a new owner to the multi-signature wallet. If the owner's address already exists, the contract will return an error.

### 2. **Remove Owner**

Removes an owner from the multi-signature wallet. This operation can only be performed by other owners.

### 3. **Submit Transaction**

Submits a transaction to be approved by the owners. The transaction will be stored in the contract, and owners can sign it to approve it.

### 4. **Sign Transaction**

Owners can sign a transaction to indicate their approval. Once the required number of signatures (as defined by the approval threshold) is obtained, the transaction can be executed.

### 5. **Execute Transaction**

If a transaction has received enough signatures, it can be executed, transferring the specified amount to the recipient.

### 6. **Cancel Transaction**

Allows the cancellation of a transaction before it is executed. If the transaction is already executed or canceled, this function will return an error.

### 7. **Get Owners**

Retrieves the list of all authorized owners in the multi-signature wallet.

### 8. **Get Transaction Status**

Returns the status of a particular transaction, indicating whether it is pending, executed, or canceled.

## Example Workflow

1. Owners are added to the wallet.
2. A transaction is submitted with a recipient address and amount.
3. Each owner signs the transaction.
4. Once the minimum number of signatures (approval threshold) is reached, the transaction is executed and the amount is transferred to the recipient.

## Use Cases

- **Decentralized Finance (DeFi)**: A multi-signature wallet can be used to manage funds in decentralized finance protocols.
- **Corporate Treasury**: Companies can use multi-signature wallets to manage funds with approval from multiple executives or stakeholders.
- **Shared Ownership**: Groups of individuals can use the wallet for shared asset management, ensuring that no single person can control the funds.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork this repository and create a pull request to suggest changes or improvements. Make sure to follow the coding standards and include proper tests for your changes.

