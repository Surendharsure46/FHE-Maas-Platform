# Test Cases & Test Report

This document outlines all test cases executed against the FHE-MaaS Platform, drawn from Chapter 6 of the [project report](../docs/REPORT.md).

---

## Testing Types Applied

| Type | Scope |
|---|---|
| **Unit Testing** | Individual functions: encryption, decryption, inference, validation |
| **Integration Testing** | Cross-module data flow: encrypt → infer → decrypt |
| **System Testing** | Full workflow from registration to result decryption |
| **Acceptance Testing** | End-user validation against requirements |
| **Performance Testing** | Latency, throughput, concurrent-request handling |
| **Security Testing** | Inference leakage resistance, unauthorized access blocks |
| **Compatibility Testing** | Multiple OS / browsers / devices |
| **User Acceptance Testing (UAT)** | Simulated production environment validation |

---

## Test Cases

### TC001 — Encrypted Data Upload

- **Input:** User uploads encrypted data for AI inference.
- **Expected:** System accepts and queues the encrypted data.
- **Actual:** Encrypted data successfully uploaded.
- **Status:** **PASS**

### TC002 — Unencrypted Data Rejection

- **Input:** User attempts to upload unencrypted data.
- **Expected:** System rejects and prompts to encrypt first.
- **Actual:** Error displayed; upload blocked.
- **Status:** **PASS**

### TC003 — Encrypted Inference

- **Input:** AI model processes encrypted data.
- **Expected:** Encrypted inference result returned.
- **Actual:** Encrypted result generated successfully.
- **Status:** **PASS**

### TC004 — Unauthorized Result Access

- **Input:** Unauthorized user attempts to access inference results.
- **Expected:** Access denied; error shown.
- **Actual:** Access blocked.
- **Status:** **PASS**

### TC005 — Valid Decryption

- **Input:** Authorized user with correct private key decrypts result.
- **Expected:** Decryption succeeds; result displayed in plaintext.
- **Actual:** Result decrypted and presented.
- **Status:** **PASS**

### TC006 — Invalid Decryption Key

- **Input:** User attempts decryption with wrong key.
- **Expected:** Decryption fails; error shown.
- **Actual:** Decryption blocked.
- **Status:** **PASS**

### TC007 — Large Dataset Processing

- **Input:** User submits a large encrypted dataset.
- **Expected:** Processed within reasonable time without timeout.
- **Actual:** Processed without performance issues.
- **Status:** **PASS**

### TC008 — Concurrent Requests

- **Input:** Multiple users submit encrypted data simultaneously.
- **Expected:** All requests processed without delay or error.
- **Actual:** Concurrent requests handled smoothly.
- **Status:** **PASS**

### TC009 — Re-Authentication on Unauthorized Access

- **Input:** User attempts result access without authentication.
- **Expected:** System prompts for re-authentication.
- **Actual:** Access blocked; re-auth prompted.
- **Status:** **PASS**

### TC010 — Real-Time Inference

- **Input:** Valid user submits encrypted data for real-time inference.
- **Expected:** Result returned in real-time, encrypted.
- **Actual:** Real-time encrypted result delivered.
- **Status:** **PASS**

### TC011 — Malformed Encrypted Input

- **Input:** User submits data with encryption errors.
- **Expected:** System detects malformed input and prompts correction.
- **Actual:** Error shown; submission rejected.
- **Status:** **PASS**

### TC012 — Insecure Device Decryption Block

- **Input:** Decryption attempted on a device with insufficient security.
- **Expected:** Decryption blocked; warning shown.
- **Actual:** Decryption blocked with security alert.
- **Status:** **PASS**

### TC013 — Admin Monitoring

- **Input:** Admin accesses system logs and metrics.
- **Expected:** Logs and real-time metrics displayed.
- **Actual:** Admin dashboard rendered correctly.
- **Status:** **PASS**

### TC014 — Account Lockout

- **Input:** Multiple failed decryption attempts.
- **Expected:** Account locked after 3 failed attempts.
- **Actual:** Account locked as expected.
- **Status:** **PASS**

### TC015 — Profile / Settings Update

- **Input:** User updates personal info or encryption settings.
- **Expected:** Changes saved and profile updated.
- **Actual:** Updates persisted successfully.
- **Status:** **PASS**

---

## Test Environment

| Component | Specification |
|---|---|
| **Server** | Cloud VM with sufficient compute for cryptographic operations |
| **OS** | Ubuntu Linux 20.04 LTS / Windows 10 |
| **Database** | MySQL 5.0+ |
| **AI Model** | Trained TensorFlow model deployed via Flask |
| **Crypto Stack** | PyCryptodome (AES-CBC) + cryptography (PBKDF2 / Fernet) |
| **Network** | HTTPS / TLS 1.3 |

---

## Test Conclusion

All 15 test cases passed. The system meets functional, security, and performance requirements. Encryption integrity, inference leakage prevention, access control, and concurrent-load handling all behave correctly under both nominal and stress conditions.

Full discussion in Chapter 6 of [REPORT.md](../docs/REPORT.md).
