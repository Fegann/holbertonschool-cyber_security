# Active Directory (AD) Fundamentals

Welcome to the Active Directory Fundamentals repository. This documentation serves as a foundational guide to understanding the core concepts, logical structures, and essential components of Microsoft Active Directory Domain Services (AD DS).

---

## 📌 Table of Contents
* [Overview](#overview)
* [Logical Structure](#logical-structure)
  * [Forest](#1-forest)
  * [Tree](#2-tree)
  * [Domain](#3-domain)
  * [Organizational Units (OUs)](#4-organizational-units-ous)
* [Objects and Group Policies](#objects-and-group-policies)
* [Physical vs. Logical Structure](#physical-vs-logical-structure)
* [Best Practices](#best-practices)

---

## 🔍 Overview

**Active Directory (AD)** is a directory service developed by Microsoft for Windows domain networks. It is included in most Windows Server operating systems as a set of processes and services. 

At its core, AD centralizes the management of users, computers, and other resources within a network, providing two essential functions:
* **Authentication:** Verifying *who* you are (Identity management, passwords).
* **Authorization:** Verifying *what* you are allowed to do (Permissions, access control).

---

## 🌳 Logical Structure

Active Directory organizes network elements into a hierarchical logical structure. This allows administrators to manage resources independently of the physical network topology.

### 1. Forest
The **Forest** is the uppermost container and the ultimate security boundary in Active Directory. 
* It contains one or more Domain Trees that share a common **Schema** (the definition of all object types and attributes) and a **Global Catalog** (a searchable index of all objects in the forest).
* Multi-forest environments require explicit **Trust Relationships** to communicate.

### 2. Tree
A **Tree** is a collection of one or more domains grouped together in a contiguous hierarchical namespace.
* For example, `sales.example.com` and `dev.example.com` are child domains belonging to the parent root domain `example.com`.
* Domains within a tree automatically establish two-way, **transitive trusts** with each other.

### 3. Domain
The **Domain** is the foundational building block of AD. It is a logical grouping of network objects (users, computers, groups) that share a single, replicated centralized database.
* Managed by servers called **Domain Controllers (DCs)**.
* Acts as an administrative boundary for applying policy and replication.

### 4. Organizational Units (OUs)
**Organizational Units** are containers within a domain used to subdivide objects into logical, manageable groups (e.g., by department or geographic location).
* **Delegation of Control:** Administrators can grant specific permissions over an OU to low-level admins without exposing the entire domain.
* **GPO Scoping:** OUs are the smallest unit to which Group Policies can be linked.

---

## ⚙️ Objects and Group Policies

### AD Objects
Everything within Active Directory is represented as an object. Objects are categorized into:
* **Resources:** Printers, shared folders, network storage.
* **Identities:** Security Principals like Users, Computers, and Security Groups.

### Group Policy Objects (GPOs)
Group Policies are configuration rules applied to system environments to enforce security restrictions and operational guidelines.
* **Hierarchical Processing:** GPOs are processed in a specific order: **LSDOU** (Local, Site, Domain, Organizational Unit). The closest policy to the object takes precedence.
* **Use Cases:** Disabling USB drives for specific departments, enforcing password complexity, pushing automated software installations, or setting uniform desktop backgrounds.

---

## 🔄 Physical vs. Logical Structure

It is critical to distinguish between how AD is organized logically versus how it is deployed physically.

| Logical Components (Organizational) | Physical Components (Infrastructure) |
| :--- | :--- |
| **Forests / Trees** (Security & naming boundaries) | **Domain Controllers** (Physical servers running AD DS) |
| **Domains** (Management boundaries) | **Sites** (IP subnets defining high-speed physical locations) |
| **OUs** (Policy & delegation boundaries) | **AD Replication** (Traffic moving between DCs over physical links) |

---

## 🛠️ Best Practices for AD Design

1. **Keep OU Structures Shallow:** Deeply nested OUs complicate Group Policy troubleshooting and slow down logon times.
2. **Standardized Naming Conventions:** Maintain a predictable naming architecture for OUs, Groups, Users, and GPOs.
3. **Principle of Least Privilege:** Use OUs to delegate specific administrative permissions instead of giving out Domain Admin rights globally.
4. **Separate User and Admin Accounts:** Administrators should use standard accounts for daily operations and high-privileged accounts only when performing administrative tasks.

---

*This repository is maintained for training and documentation purposes. For contributions or corrections, please open an issue or submit a pull request.*
