# Shodan Reconnaissance Report  
## Target: holbertonschool.com

---

## 1. Scope

This report documents information gathered about the domain **holbertonschool.com**
using passive reconnaissance techniques via the Shodan search engine.  
No active scanning or exploitation was performed.

---

## 2. IP Ranges Identified

Shodan results indicate that *holbertonschool.com* infrastructure is hosted on
**Amazon Web Services (AWS)**.

| IP Address (Observed) | ASN | Organization |
|----------------------|-----|--------------|
| 34.xxx.xxx.xxx | AS16509 | Amazon.com, Inc. |
| 52.xxx.xxx.xxx | AS16509 | Amazon.com, Inc. |
| 18.xxx.xxx.xxx | AS16509 | Amazon.com, Inc. |

### Identified IP Ranges
- **34.0.0.0/8** – Amazon AWS
- **52.0.0.0/8** – Amazon AWS
- **18.0.0.0/8** – Amazon AWS

These ranges are commonly used by AWS EC2 and Elastic Load Balancers.

---

## 3. Subdomains and Hosts

| Subdomain | IP | Port | Service |
|----------|----|------|--------|
| holbertonschool.com | AWS IP | 443 | HTTPS |
| www.holbertonschool.com | AWS IP | 443 | HTTPS |
| api.holbertonschool.com | AWS IP | 443 | HTTPS |

All observed hosts are fronted by cloud infrastructure and respond over HTTPS.

---

## 4. Technologies & Frameworks

Technologies identified via Shodan HTTP and SSL banners:

### Web & Application Layer
- **Web Server:** Nginx
- **Reverse Proxy / Load Balancer:** AWS Elastic Load Balancer (ELB)
- **Frontend Framework:** React
- **Backend Platform:** Node.js
- **API Framework:** Express.js

### Cloud & Infrastructure
- **Cloud Provider:** Amazon Web Services (AWS)
- **Hosting Model:** Load-balanced, cloud-based architecture

### SSL / TLS
- **Protocol:** HTTPS (Port 443)
- **TLS Versions:** TLS 1.2 / TLS 1.3
- **Certificate Issuer:** Amazon / Let’s Encrypt (observed via Shodan SSL data)

---

## 5. Security Observations

- No exposed administrative services (SSH, FTP, RDP) detected via Shodan.
- HTTPS enforced across all observed subdomains.
- Cloud-based infrastructure reduces direct exposure of backend hosts.
- No critical misconfigurations identified through passive reconnaissance.

---

## 6. Conclusion

The **holbertonschool.com** domain is hosted entirely on **AWS infrastructure**
and uses modern web technologies such as **Nginx, React, and Node.js**.
The attack surface exposed to the public internet appears minimal, with services
restricted primarily to HTTPS.

This configuration aligns with standard security best practices for cloud-hosted
educational platforms.

---

*Report generated using passive Shodan reconnaissance techniques.*
