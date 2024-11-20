;; Multi-Signature Wallet Contract
;;
;; This smart contract implements a decentralized multi-signature wallet 
;; where multiple authorized owners must approve transactions before they 
;; can be executed. The contract now includes functionality to retrieve 
;; a list of authorized owners.

;; Error constants for transaction handling
(define-constant ERR-NOT-AUTHORIZED (err u100))      ;; Unauthorized access attempt
(define-constant ERR-ALREADY-EXECUTED (err u101))   ;; Transaction already executed
(define-constant ERR-INVALID-THRESHOLD (err u102))   ;; Invalid approval threshold
(define-constant ERR-DUPLICATE_SIGNATURE (err u103)) ;; Signature already recorded
(define-constant ERR-INSUFFICIENT_SIGNATURES (err u104)) ;; Not enough signatures to execute
(define-constant ERR-INVALID_RECIPIENT (err u105))   ;; Invalid recipient address
(define-constant ERR-INVALID_AMOUNT (err u106))      ;; Invalid transaction amount
(define-constant ERR-TRANSFER_FAILED (err u107))     ;; STX transfer failure
(define-constant ERR-TRANSACTION-NOT-PENDING (err u108)) ;; Transaction cannot be canceled
(define-constant ERR-ALREADY-CANCELED (err u109))    ;; Transaction already canceled
(define-constant ERR-OWNERS-LIST-FULL (err u110))    ;; Maximum number of owners reached

;; Configuration data: stores the approval threshold and current transaction ID
(define-data-var approval-threshold uint u2) ;; Minimum number of signatures required for a transaction
(define-data-var current-transaction-id uint u0) ;; Tracks the next available transaction ID

;; Owner registry: stores authorized owners' principal addresses
(define-map authorized-owners principal bool)

;; List of owners to maintain order and enable listing
(define-data-var owners-list (list 20 principal) (list))

;; Transaction records: stores the details of each transaction
(define-map transaction-records 
    uint ;; Transaction ID
    {
        recipient: principal, ;; Recipient of the transaction
        amount: uint,          ;; Amount to transfer
        executed: bool,       ;; Whether the transaction has been executed
        canceled: bool,       ;; Whether the transaction has been canceled
        signatures-count: uint ;; Number of signatures for approval
    }
)

;; Transaction signatures: tracks which owners have signed each transaction
(define-map transaction-signatures 
    {transaction-id: uint, owner: principal} 
    bool
)
