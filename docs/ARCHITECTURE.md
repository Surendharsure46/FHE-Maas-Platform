# System Architecture — Deep Dive

This document expands on the high-level architecture shown in the main [README](../README.md).

---

## Actors

| Actor | Role |
|---|---|
| **MaaS Service Provider (Admin)** | Central authority. Approves registrations, monitors usage, manages key distribution. |
| **Model Owner (Developer)** | Trains the AI model, encrypts it, and deploys it to the platform. |
| **Model User (Client)** | Encrypts input data, submits queries, and decrypts results locally. |

---

## End-to-End Encrypted Inference Flow

```
[Model Owner]                [Service Provider]              [Model User]
     │                              │                              │
     │── Register ─────────────────>│                              │
     │<─────── Approval ────────────│<──────── Register ───────────│
     │                              │── Approval ────────────────>│
     │                              │                              │
     │<───── Key Pair (pk, sk) ─────│── Key Pair (pk, sk) ───────>│
     │                              │                              │
     │── Encrypt(model, pk) ───────>│                              │
     │   Deploy E(model)            │                              │
     │                              │<──── Encrypt(input, pk) ─────│
     │                              │                              │
     │                       ┌──────┴─────────┐                    │
     │                       │ Encrypted      │                    │
     │                       │ Inference      │                    │
     │                       │ E(model) ∘     │                    │
     │                       │ E(input) →     │                    │
     │                       │ E(result)      │                    │
     │                       └──────┬─────────┘                    │
     │                              │                              │
     │                              │── E(result) ───────────────>│
     │                              │                       Decrypt(E(result), sk)
     │                              │                       → plaintext result
```

**Key property:** The Service Provider never holds plaintext at any stage.

---

## Data Flow Diagrams

### Level 0 (Context Diagram)

```
       ┌──────────────┐                        ┌──────────────┐
       │ Model Owner  │── Encrypted Model ───> │              │
       └──────────────┘                        │   FHE-MaaS   │
                                               │   Platform   │
       ┌──────────────┐── Encrypted Input ───> │              │
       │ Model User   │<── Encrypted Output ── │              │
       └──────────────┘                        └──────────────┘
```

### Level 1 (System Decomposition)

```
                  ┌────────────────────────────────────────┐
                  │             FHE-MaaS Platform          │
                  │                                        │
   Owner ────────>│  1. Auth & Registration                │
                  │  2. Key Generation                     │
   User  ────────>│  3. Encrypted Model Repository         │
                  │  4. Inference Engine                   │
   Admin ────────>│  5. Audit & Monitoring                 │
                  │  6. Encrypted Result Delivery          │
                  └────────────────────────────────────────┘
```

### Level 2 (Module-Level Detail)

See module-by-module breakdown in [REPORT.md](REPORT.md#72-modules-description).

---

## UML Diagram Summary

The full report contains six UML perspectives:

| Diagram | Purpose | Location in Report |
|---|---|---|
| **Use Case** | Actor-to-feature mapping | Section 5.3.1 |
| **Class** | Object model and relationships | Section 5.3.2 |
| **Activity** | Step-by-step workflow logic | Section 5.3.3 |
| **Sequence** | Time-ordered message exchange | Section 5.3.4 |
| **Collaboration** | Object communication patterns | Section 5.3.5 |
| **Component** | Deployment and service composition | Section 5.3.6 |

> When you generate the diagrams in your tool of choice (draw.io, Lucidchart, PlantUML), export them as PNGs into `docs/screenshots/` and link them here.

---

## Route Map (main.py)

All routes are defined in the single Flask file `main.py`:

| Route | Method | Purpose |
|---|---|---|
| `/` | GET, POST | Landing page |
| `/login` | GET, POST | Admin login |
| `/login_user` | GET, POST | Model User login |
| `/login_dev` | GET, POST | Model Owner login |
| `/register` | GET, POST | Model User registration |
| `/reg_dev` | GET, POST | Model Owner registration |
| `/admin` | GET, POST | Admin dashboard |
| `/admin2`, `/admin3` | GET, POST | Admin sub-pages |
| `/view_user` | GET, POST | Admin view of all users |
| `/dev_home` | GET, POST | Model Owner dashboard |
| `/dev_upload` | GET, POST | Upload encrypted model |
| `/dev_upload2`, `/dev_upload3`, `/dev_upload4` | GET, POST | Upload workflow steps |
| `/dev_key` | GET, POST | Model Owner key page |
| `/dev_meta` | GET, POST | Add model metadata |
| `/dev_view` | GET, POST | View deployed models |
| `/dev_usage` | GET, POST | View model usage logs |
| `/userhome` | GET, POST | Model User dashboard |
| `/user_upload` | GET, POST | Upload encrypted input |
| `/user_upload1`, `/user_upload2`, `/user_upload3` | GET, POST | Upload workflow steps |
| `/user_process` | GET, POST | Run inference on encrypted input |
| `/user_key` | GET, POST | Submit private key to decrypt result |
| `/view_usage` | GET, POST | View usage history |
| `/view_model` | GET, POST | View model details |
| `/down` | GET, POST | Download a file |
| `/logout` | GET | Clear session and redirect |

---

## Database Schema (Overview)

| Table | Purpose |
|---|---|
| `am_admin` | Service Provider credentials |
| `am_developer` | Model Owner accounts and key pairs |
| `am_user` | Model User accounts and key pairs |
| `am_model` | Registered encrypted models |
| `am_label` | Encrypted training labels per model |
| `am_data` | Encrypted user-submitted input data |
| `am_test` | Inference results and accuracy scores |
| `model_metadata` | Public model metadata (name, version, type, accuracy) |

Full schema in [`database/aiaas_model.sql`](../database/aiaas_model.sql).

---

## Encryption Implementation

The implementation uses **AES-256 in CBC mode** via PyCryptodome, with PBKDF2 key derivation from passwords. Highlights from the `AESCipher` class in `main.py`:

| Step | Detail |
|---|---|
| **Key derivation** | `hashlib.sha256(key.encode()).digest()` produces a 256-bit key |
| **IV** | Fresh random 16-byte IV per encryption call (`Random.new().read(AES.block_size)`) |
| **Padding** | PKCS#7-style padding to AES block size |
| **Ciphertext format** | `base64(iv || cipher)` for safe storage in MySQL TEXT columns |

This provides confidentiality and authenticity for the encrypted records stored server-side. The architecture is extensible — the `AESCipher` class can be swapped for a Fully Homomorphic Encryption module (e.g. Microsoft SEAL via PySEAL) when production-grade FHE performance becomes available.

---

## Security Properties

| Property | Guarantee |
|---|---|
| **Confidentiality** | Plaintext never leaves the client device |
| **Integrity** | Ciphertext tampering detectable via padding-validation failure |
| **Authenticity** | User accounts gated by registration + admin approval |
| **Access Control** | Decryption keys required for result retrieval |
| **Inference Leakage Resistance** | Server outputs are ciphertext, defeating model inversion |

---

## Performance Considerations

To support real-time use cases like facial recognition, the implementation:

- Uses **perceptual image hashing** (`imagehash`) for fast similarity comparison
- Pre-computes image hashes at upload time
- Caches encrypted records in MySQL to avoid re-encryption per query
- Uses **integer-friendly operations** that can later be ported to FHE (BFV scheme)

For deeper benchmarks, see Chapter 6 (System Testing) of the [REPORT](REPORT.md).
