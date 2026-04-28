# 0x07. Web Security: File Inclusion - Task 0

This project focuses on identifying and exploiting **Local File Inclusion (LFI)** and **Path Traversal** vulnerabilities within a web application.

## 🎯 Objective
Identify the vulnerable endpoint and retrieve the flag located at `/etc/0-flag.txt` on the target server.

## 🔍 Target Details
- **Target Machine:** `Cyber - WebSec 0x07`
- **Main Endpoint:** `http://web0x07.hbtn/task0/list_file`
- **Vulnerable Endpoint:** `http://web0x07.hbtn/task0/download_file`

## 🛠️ Exploitation Process

1.  **Reconnaissance:** Analyzed the source code of the `list_file` page. A link was discovered that processes file downloads using two parameters: `filename` and `path`.
    - Example: `download_file?filename=README.md&path=.`
2.  **Vulnerability Identification:** The `path` parameter was found to be unsanitized, allowing for directory traversal using the `../` (dot-dot-slash) sequence.
3.  **Payload Construction:** To access the system-level directory where the flag is stored, a relative path was constructed to move up four levels from the web directory to the root, then into the `/etc` folder.
    - **Final Payload:**
      `http://web0x07.hbtn/task0/download_file?filename=0-flag.txt&path=../../../../etc`

## 🚩 Flag
`{INSERT_YOUR_FLAG_HERE}`

## 🛡️ Remediation Strategies
To prevent Path Traversal and File Inclusion attacks, the following measures should be implemented:
* **Input Validation:** Strictly validate user-supplied input. Sanitize or strip out `../` and `/` characters.
* **Whitelisting:** Only allow specific, predefined file names and paths to be accessed.
* **Filesystem Permissions:** Run the web server with the least privilege necessary, ensuring it cannot access sensitive system files like `/etc/passwd`.
* **Indirect Referencing:** Instead of using actual file paths in URL parameters, use unique identifiers (e.g., database IDs) mapped to files on the server.
