<div align="center">

# Cryptographically Protected Model-as-a-Service (MaaS)

### Zero-Exposure AI Inference using Fully Homomorphic Encryption

*A privacy-preserving cloud framework where AI models compute on encrypted data — the server never sees plaintext input, output, or model internals.*

[![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-1.1-000000?style=flat-square&logo=flask&logoColor=white)](https://flask.palletsprojects.com/)
[![MySQL](https://img.shields.io/badge/MySQL-5.7+-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)](https://www.tensorflow.org/)
[![SEAL](https://img.shields.io/badge/Microsoft-SEAL-00A4EF?style=flat-square&logo=microsoft&logoColor=white)](https://github.com/microsoft/SEAL)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-success.svg?style=flat-square)]()

</div>

---

## Table of Contents

- [About the Project](#about-the-project)
- [Key Features](#key-features)
- [System Architecture](#system-architecture)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [How It Works](#how-it-works)
- [Modules Overview](#modules-overview)
- [Testing](#testing)
- [Screenshots](#screenshots)
- [Future Enhancements](#future-enhancements)
- [Documentation](#documentation)
- [References](#references)
- [License](#license)
- [Author](#author)

---

## About the Project

Cloud-based Model-as-a-Service (MaaS) platforms typically require users to upload **plaintext** data to remote servers for AI inference. This creates serious risks: **inference leakage attacks**, **model inversion**, **membership inference**, and outright **data breaches**.

This project solves the problem at its root. Using **Fully Homomorphic Encryption (FHE)**, both the AI model and the user's input data are encrypted **before** they reach the server. The server then performs computation **directly on ciphertext** — addition, multiplication, and the operations required for neural-network inference — and returns an **encrypted result** that only the authorized user can decrypt.

At no point in the pipeline is plaintext exposed to the cloud provider.

> **Use cases:** Secure facial recognition, healthcare diagnostics, financial risk scoring, biometric authentication, and any AI workload where regulatory compliance (HIPAA, GDPR, PCI-DSS) or data sensitivity is critical.

---

## Key Features

| Feature | Description |
|---|---|
| **End-to-End Encryption** | Data stays encrypted at rest, in transit, **and during computation**. |
| **Zero-Exposure Inference** | The MaaS provider never sees plaintext input, output, or model parameters. |
| **FHE-Based Computation** | Built on the Microsoft SEAL / PySEAL BFV scheme for arbitrary integer arithmetic. |
| **Three-Role Architecture** | Distinct flows for Model Owners, Model Users, and the MaaS Service Provider (Admin). |
| **Secure Key Management** | Public–private key pairs generated and distributed per stakeholder. |
| **Model Inversion Protection** | Adversaries cannot reconstruct model internals from outputs. |
| **Quantum-Resilient** | FHE schemes used are secure against quantum adversaries. |
| **Regulatory Compliance** | Supports HIPAA, GDPR, and PCI-DSS data-handling requirements. |
| **Real-Time Capable** | Optimized inference workflow suitable for facial verification and rapid prediction. |
| **Audit Trail** | Full model-usage history and access logs for accountability. |

---

## System Architecture

The system is built around three actors and seven core modules. Encrypted data flows through the pipeline without any intermediate decryption.

```
┌────────────────────┐                                    ┌────────────────────┐
│   MODEL OWNER      │                                    │   MODEL USER       │
│   (Developer)      │                                    │   (Client)         │
│                    │                                    │                    │
│  • Register        │                                    │  • Register        │
│  • Receive Keys    │                                    │  • Receive Keys    │
│  • Encrypt Model   │                                    │  • Encrypt Input   │
│  • Deploy          │                                    │  • Decrypt Result  │
└─────────┬──────────┘                                    └─────────┬──────────┘
          │                                                         │
          │ Encrypted Model                       Encrypted Input   │
          │                                                         │
          ▼                                                         ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                       MaaS SERVICE PROVIDER (Cloud)                         │
│                                                                             │
│   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌─────────────┐  │
│   │ User Mgmt &  │   │ Key Gen &    │   │ FHE-Based    │   │ Encrypted   │  │
│   │ Approval     │ → │ Distribution │ → │ Inference    │ → │ Result Send │  │
│   └──────────────┘   └──────────────┘   └──────────────┘   └─────────────┘  │
│                                                                             │
│   ⚠  Server NEVER decrypts data, model parameters, or inference outputs    │
└─────────────────────────────────────────────────────────────────────────────┘
                                       │
                                       │ Encrypted Result
                                       ▼
                          ┌────────────────────────┐
                          │  User decrypts locally │
                          │  with private key      │
                          └────────────────────────┘
```

Detailed architecture, DFD (Level 0/1/2), UML diagrams (Use Case, Class, Sequence, Activity, Collaboration, Component), and ER Diagrams are available in [`docs/REPORT.md`](docs/REPORT.md).

---

## Tech Stack

### Backend
- **Python 3.8+** — core language
- **Flask 1.1** — web framework
- **TensorFlow 2.x** — neural-network inference
- **scikit-learn** — classical ML algorithms
- **PySEAL / Microsoft SEAL** — Fully Homomorphic Encryption (BFV scheme)
- **OpenCV + PIL + imagehash** — image preprocessing for facial recognition

### Frontend
- **HTML5, CSS3, JavaScript**
- **Bootstrap 4** — responsive, mobile-first UI

### Database
- **MySQL 5.7+** — relational storage for users, models, encrypted records, and audit logs

### Infrastructure / Dev Environment
- **WampServer 2i** — local Apache + MySQL stack (Windows)
- **HTTPS / TLS** — secure transport layer

### Data Science
- **NumPy**, **Pandas**, **Matplotlib**, **Seaborn**

---

## Project Structure

```
fhe-maas-platform/
│
├── README.md                  # This file
├── LICENSE                    # MIT License
├── CONTRIBUTING.md            # Contribution guidelines
├── .gitignore                 # Files excluded from version control
├── requirements.txt           # Python dependencies
│
├── docs/                      # Project documentation
│   ├── REPORT.md              # Full project report (abstract → references)
│   ├── ARCHITECTURE.md        # Deep-dive system architecture
│   └── screenshots/           # UI screenshots for documentation
│
├── src/                       # Application source code
│   ├── app.py                 # Flask entry point
│   ├── config.py              # Configuration (DB, keys, paths)
│   ├── encryption/            # FHE module
│   │   ├── fhe_keygen.py      # Key pair generation (BFV scheme)
│   │   ├── encrypt.py         # Encryption logic
│   │   └── decrypt.py         # Decryption logic
│   ├── routes/                # Flask blueprints
│   │   ├── admin.py           # Service Provider routes
│   │   ├── owner.py           # Model Owner routes
│   │   └── user.py            # Model User routes
│   ├── ml_models/             # Trained ML models (encrypted at rest)
│   └── utils/                 # Helpers (hashing, validation, logging)
│
├── database/
│   └── schema.sql             # MySQL schema (am_admin, am_developer, am_model, ...)
│
├── static/                    # Static assets served by Flask
│   ├── css/
│   ├── js/
│   ├── images/
│   └── uploads/               # User-uploaded encrypted artifacts
│
├── templates/                 # Jinja2 templates
│   ├── base.html
│   ├── admin/
│   ├── owner/
│   └── user/
│
└── tests/                     # Test suite
    └── TEST_CASES.md          # 15 documented test cases (TC001–TC015)
```

---

## Prerequisites

Before installing, ensure you have the following:

- **Python 3.8 or higher**
- **MySQL Server 5.7+** (or WampServer 2i on Windows)
- **Git**
- **pip** (Python package manager)
- **Microsoft SEAL / PySEAL** built locally (see [SEAL build instructions](https://github.com/microsoft/SEAL))

### Hardware (recommended)

| Component | Specification |
|---|---|
| Processor | Intel Core i7 or equivalent |
| RAM | 8 GB minimum (16 GB recommended for FHE workloads) |
| Storage | 256 GB SSD |
| OS | Windows 10 / Ubuntu 20.04 LTS |

---

## Installation & Setup

### 1. Clone the repository

```bash
git clone https://github.com/<your-username>/fhe-maas-platform.git
cd fhe-maas-platform
```

### 2. Create a virtual environment

```bash
python -m venv venv

# On Windows
venv\Scripts\activate

# On macOS/Linux
source venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Set up the database

Start MySQL (or WampServer), then:

```bash
mysql -u root -p < database/schema.sql
```

This creates the `MaaS_model` database with all required tables.

### 5. Configure credentials

Edit `src/config.py` and update database credentials:

```python
DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = ""
DB_NAME = "MaaS_model"
```

### 6. Run the application

```bash
cd src
python app.py
```

The server starts at **`http://127.0.0.1:5000`**.

---

## How It Works

The end-to-end encrypted inference workflow runs in seven steps:

1. **Registration & Approval** — Model Owners and Model Users register; the MaaS Provider (Admin) approves each account.
2. **Key Generation** — The system generates a BFV public–private key pair per user using PySEAL's `KeyGenerator`.
3. **Model Encryption** — The Model Owner encrypts model features with their public key and uploads the encrypted model.
4. **Input Encryption** — The Model User encrypts their input data locally using their public key before transmission.
5. **Encrypted Inference** — The server runs the model on ciphertext via FHE operations (`evaluator.add`, `evaluator.multiply`). **No decryption occurs server-side.**
6. **Encrypted Output Delivery** — The result, still encrypted, is sent back to the user.
7. **Local Decryption** — The user decrypts the result with their private key. Only they can see the plaintext output.

---

## Modules Overview

| # | Module | Responsibility |
|---|---|---|
| 1 | **MaaS Service Provider** | User approval, key distribution oversight, system monitoring, audit logging |
| 2 | **System User Module** | Registration, login, and dashboards for Model Owners and Model Users |
| 3 | **Key Generation Module** | BFV key-pair generation and secure distribution to authorized stakeholders |
| 4 | **Data Encryption Module** | Client-side FHE encryption of model features and user inputs |
| 5 | **AI Model Evaluation Module** | Performs inference directly on ciphertext using TensorFlow + SEAL |
| 6 | **Encrypted Output Generation** | Packages encrypted predictions for secure transmission |
| 7 | **Result Decryption Module** | Client-side decryption of inference results with private key validation |

---

## Testing

The system has been validated through **15 documented test cases** covering:

- Encryption / decryption correctness
- Unauthorized access prevention
- Real-time inference performance
- Concurrent request handling
- Large dataset processing
- Failed-decryption account lockout
- Admin monitoring and logging

Full test report: [`tests/TEST_CASES.md`](tests/TEST_CASES.md)

**Testing types applied:** Unit, Integration, System, Acceptance, Performance, Security, Compatibility, and User Acceptance Testing (UAT).

---

## Screenshots

UI screenshots and workflow walkthroughs are in [`docs/screenshots/`](docs/screenshots/).

> Add your application screenshots to this folder and reference them here:
> ```markdown
> ![Login Page](docs/screenshots/login.png)
> ![Owner Dashboard](docs/screenshots/owner-dashboard.png)
> ![Encrypted Inference Flow](docs/screenshots/inference.png)
> ```

---

## Future Enhancements

- **Mobile-Friendly UI** — Responsive React Native or PWA frontend
- **Multi-Model Support** — Deep neural networks, transformers, and ensemble models
- **Blockchain Audit Trail** — Immutable logging via Ethereum/Hyperledger
- **GPU Acceleration** — CUDA-backed FHE operations for sub-second inference
- **Cloud-Native Deployment** — Kubernetes + Docker for horizontal scaling
- **Multi-Tenant Key Vault** — HSM-backed key management

---

## Documentation

- [Full Project Report](docs/REPORT.md) — Abstract, problem statement, system analysis, design, implementation, and conclusion
- [Architecture Deep Dive](docs/ARCHITECTURE.md) — DFDs, UML diagrams, ER diagrams
- [Test Cases](tests/TEST_CASES.md) — All 15 test scenarios and outcomes

---

## References

### Selected Journal References

1. X. Pei et al., *"Privacy-enhanced graph neural network for decentralized local graphs"*, IEEE Transactions on Information Forensics and Security, vol. 19, pp. 1614–1629, 2024.
2. L. Bergerat et al., *"Parameter Optimization and Larger Precision for (T)FHE"*, Journal of Cryptology, vol. 36, no. 3, 2023.
3. L. Folkerts, C. Gouert, N. G. Tsoutsos, *"REDsec: Running Encrypted Discretized Neural Networks in Seconds"*, NDSS, 2023.
4. N. Carlini et al., *"Membership inference attacks from first principles"*, IEEE S&P, 2022.
5. M. S. Rahman et al., *"Homomorphic encryption in secure AI model evaluation"*, Int. J. Information Security, 2023.

Full reference list (journal, book, and web sources) available in [`docs/REPORT.md`](docs/REPORT.md#references).

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## Author

**[SURENDHAR S]**

- GitHub: [@your-username](https://github.com/your-username)
- LinkedIn: [(https://www.linkedin.com/jobs/view/4411334198/)]
- Email: s.surendharsure2004@gmail.com

---

<div align="center">

**If you found this project useful, please consider giving it a star.**

*Built with the goal of making privacy-preserving AI practical and accessible.*

</div>
