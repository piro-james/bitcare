;; BitCare: Transparent Charity Platform on Bitcoin L2
;; A decentralized donation platform that enables transparent fundraising 
;; and fund distribution with proper governance controls. Built on Stacks
;; with Bitcoin settlement capabilities.

;; Constants and Error Codes

;; Contract owner
(define-data-var contract-owner principal tx-sender)

;; Error constants
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; Role definitions
(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; Data Structures

;; User roles mapping
(define-map roles
    { user: principal }
    { role: uint }
)

;; Beneficiary information
(define-map beneficiaries
    { id: uint }
    {
        name: (string-utf8 50),
        description: (string-utf8 255),
        target-amount: uint,
        received-amount: uint,
        status: (string-ascii 20),
    }
)

;; Donation records
(define-map donations
    { id: uint }
    {
        donor: principal,
        beneficiary-id: uint,
        amount: uint,
        timestamp: uint,
    }
)