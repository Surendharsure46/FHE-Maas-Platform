# System Architecture — Deep Dive

This document expands on the high-level architecture shown in the main [README](../README.md).

---

## Actors

| Actor | Role |
|---|---|
| **MaaS Service Provider (Admin)** | Central authority. Approves registrations, monitors usage, manages key distribution. |
| **Model Owner (Developer)** | Trains the AI model, encrypts it with FHE, and deploys it to the platform. |
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
     │                       │ FHE Inference  │                    │
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
                  │  4. FHE Inference Engine               │
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

Full schema in [`database/schema.sql`](../database/schema.sql).

---

## FHE Parameter Choices

The implementation uses the **BFV scheme** from Microsoft SEAL via PySEAL:

| Parameter | Value | Rationale |
|---|---|---|
| `poly_modulus_degree` | 4096 | Balances security and performance for integer arithmetic |
| `coeff_modulus` | `BFVDefault(4096)` | Default secure modulus chain for n=4096 |
| `plain_modulus` | 1024 | Sufficient precision for inference outputs |
| Security Level | 128-bit | Matches NIST recommendations |

These parameters can be tuned in `src/encryption/fhe_keygen.py`.

---

## Security Properties

| Property | Guarantee |
|---|---|
| **Confidentiality** | Plaintext never leaves the client device |
| **Integrity** | Ciphertext tampering detectable via SEAL's noise budget checks |
| **Authenticity** | User accounts gated by registration + admin approval |
| **Forward Secrecy** | Per-session key pairs prevent replay across sessions |
| **Quantum Resistance** | Lattice-based FHE is post-quantum secure |
| **Inference Leakage Resistance** | Server outputs are ciphertext, defeating model inversion |

---

## Performance Considerations

FHE imposes real computational cost. To make the system viable for real-time use cases like facial recognition, the implementation:

- Batches multiple plaintexts into a single ciphertext using SEAL's SIMD-style encoding
- Pre-computes evaluation keys and relinearization keys at deployment time
- Uses integer-only models (quantized weights) to avoid expensive bootstrapping
- Caches encrypted model parameters to avoid re-encryption per query

For deeper benchmarks, see Chapter 6 (System Testing) of the [REPORT](REPORT.md).
