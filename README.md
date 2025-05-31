# BitCare: Transparent Charity Platform on Bitcoin L2

BitCare is a decentralized donation and fund utilization tracking platform built on the **Stacks blockchain**, enabling Bitcoin-settled charitable giving with **transparency**, **governance**, and **accountability** at its core.

## 🌍 Overview

BitCare is designed to transform how charitable donations are managed and monitored by providing:

* **Immutable records** of donations
* **Governance-controlled role assignments**
* **Verified utilization tracking** of donated funds
* **End-to-end transparency** from donation to disbursement

Built on **Stacks**, BitCare inherits Bitcoin’s finality and security while leveraging Clarity's predictability and auditability.

---

## ✨ Features

* **Role-Based Access Control (RBAC):**

  * `Admin`, `Moderator`, and `Beneficiary` roles
  * Admins can assign/remove roles
* **Beneficiary Registration:**

  * Moderators can register new beneficiaries with funding goals
* **Donation System:**

  * Anyone can donate STX to verified beneficiaries
  * Records donor, amount, beneficiary, and block height
* **Utilization Planning & Approval:**

  * Admins define and approve fund utilization milestones
  * Ensures donations are used as intended
* **Auditability:**

  * All donation and utilization records are queryable on-chain

---

## 🏗️ Smart Contract Architecture

```
+-----------------------------+
|         BitCare Contract   |
+-----------------------------+
| - contract-owner           |
| - roles map                |
| - beneficiaries map        |
| - donations map            |
| - utilization map          |
| - state variables          |
+-----------------------------+
         |        |         |
         v        v         v
+--------+   +--------+  +--------+
| Register  | | Donate  | | Track  |
| Benefici- | | Funds   | | Fund   |
| ary       | | to Bene-| | Usage  |
+-----------+ | ficiaries| +--------+
              +----------+
```

* **Roles**: Admins govern, Moderators manage, Beneficiaries receive.
* **Maps**:

  * `roles`: user-to-role mapping
  * `beneficiaries`: charitable entity data
  * `donations`: donations ledger
  * `utilization`: fund usage tracking per milestone

---

## 🧑‍💻 Contract Methods

### 🔐 Role Management

| Function                   | Description                           |
| -------------------------- | ------------------------------------- |
| `set-role(user, new-role)` | Assigns a role to a user (admin only) |
| `remove-role(user)`        | Removes a user’s role (admin only)    |

### 🎗️ Beneficiary Management

| Function                                                 | Description                             |
| -------------------------------------------------------- | --------------------------------------- |
| `register-beneficiary(name, description, target-amount)` | Adds a new beneficiary (moderator only) |
| `get-beneficiary(id)`                                    | Reads beneficiary data by ID            |

### 💸 Donation System

| Function                         | Description                    |
| -------------------------------- | ------------------------------ |
| `donate(beneficiary-id, amount)` | Transfers STX to a beneficiary |
| `get-donation-by-id(id)`         | Fetches donation details       |
| `get-donation-count()`           | Total number of donations      |

### 📊 Fund Utilization

| Function                                               | Description                                 |
| ------------------------------------------------------ | ------------------------------------------- |
| `add-utilization(beneficiary-id, description, amount)` | Propose a fund usage milestone (admin only) |
| `approve-utilization(utilization-id, beneficiary-id)`  | Approves milestone for fund release         |
| `get-utilization-by-id(id)`                            | Fetches utilization data                    |
| `get-utilization-count()`                              | Total utilization records                   |

---

## 🚀 Deployment & Initialization

Upon deployment, the deployer is:

* Set as the **contract owner**
* Assigned the **Admin** role

Initialization is handled automatically via:

```clojure
(initialize-contract)
```

---

## 📦 Example Usage

### Registering a Beneficiary

```clojure
(register-beneficiary "Water Relief" "Build wells in region X" u50000)
```

### Donating to a Beneficiary

```clojure
(donate u1 u1000)
```

### Approving Fund Usage

```clojure
(approve-utilization u1 u1)
```

---

## 🛡️ Error Handling

BitCare uses explicit error codes for clarity:

* `u100`: Not Authorized
* `u101`: Already Registered
* `u102`: Not Found
* `u103`: Insufficient Funds
* `u104`: Beneficiary Not Found
* `u105`: Utilization Not Found
* `u106`: Invalid Input

---

## 📚 Prerequisites

* [Stacks CLI](https://docs.stacks.co/cli) installed
* A local or testnet Stacks node
* Basic Clarity & smart contract development knowledge
