# SSRF (Server-Side Request Forgery) README

## Overview

Server-Side Request Forgery (SSRF) is a web security vulnerability that allows an attacker to make a server send requests to unintended locations. Instead of the attacker directly accessing internal systems, the vulnerable server performs the request on their behalf.

This can lead to:

* Access to internal services
* Cloud metadata exposure
* Internal port scanning
* Sensitive data leakage
* Remote code execution (in some cases)

---

## How SSRF Works

Many web applications allow users to provide a URL for features such as:

* Importing images from a URL
* Fetching website previews
* Webhooks
* PDF generation
* File downloaders

If the application does not validate the supplied URL properly, an attacker can force the server to request:

* `http://localhost`
* `http://127.0.0.1`
* `http://169.254.169.254`
* Internal private IP ranges
* Internal admin panels

---

## Example Scenario

A website has this feature:

```http
POST /fetch-image
url=http://example.com/image.jpg
```

Instead of a normal URL, an attacker submits:

```http
url=http://127.0.0.1/admin
```

The server requests its own internal admin page and returns the response.

---

## Common Targets

### Localhost

```text
127.0.0.1
localhost
::1
```

### Private Networks

```text
10.0.0.0/8
172.16.0.0/12
192.168.0.0/16
```

### Cloud Metadata Services

#### AWS

```text
http://169.254.169.254/latest/meta-data/
```

#### Azure

```text
http://169.254.169.254/metadata/
```

#### Google Cloud

```text
http://metadata.google.internal/
```

---

## SSRF Techniques

### Basic SSRF

Direct request to internal target.

### Blind SSRF

No direct response is shown, but the request is triggered.

### DNS Rebinding

Changing DNS resolution after validation.

### URL Bypass Tricks

```text
http://127.1
http://0x7f000001
http://2130706433
http://localhost@evil.com
http://evil.com#localhost
```

---

## Detection Methods

* Analyze URL-fetching features
* Test localhost/private IP access
* Use Burp Collaborator / Interactsh for blind SSRF
* Observe response timing
* Check error messages

---

## Prevention

### Input Validation

* Allow only trusted domains
* Block private/internal IP ranges
* Normalize URLs before validation

### Network Controls

* Restrict outbound connections
* Firewall internal services
* Use egress filtering

### Secure Cloud Config

* Disable unnecessary metadata access
* Use IMDSv2 on AWS

---

## Example Secure Logic

```python
allowed_domains = ["trusted.com"]

if url.domain not in allowed_domains:
    deny_request()
```

---

## Tools for Testing

* Burp Suite
* Interactsh
* curl
* ffuf
* Nuclei

---

## Real Impact

Successful SSRF may lead to:

* Stealing cloud credentials
* Internal network mapping
* Accessing admin panels
* Data exfiltration
* Pivoting to deeper compromise

---

## References

* OWASP SSRF Prevention Cheat Sheet
* PortSwigger Web Security Academy
* HackerOne Reports

---

## Disclaimer

Use SSRF knowledge only for authorized security testing and educational purposes. Unauthorized testing is illegal.

