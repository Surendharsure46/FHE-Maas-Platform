<div align="center">

# Cryptographically Protected Model-as-a-Service (MaaS)

### Zero-Exposure AI Inference using Homomorphic Computation

*A privacy-preserving Flask-based platform where AI models perform inference on encrypted data — the server never sees plaintext input, output, or model internals.*

[![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-1.1+-000000?style=flat-square&logo=flask&logoColor=white)](https://flask.palletsprojects.com/)
[![MySQL](https://img.shields.io/badge/MySQL-5.0+-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)](https://www.tensorflow.org/)
[![OpenCV](https://img.shields.io/badge/OpenCV-4.x-5C3EE8?style=flat-square&logo=opencv&logoColor=white)](https://opencv.org/)
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
- [Running the Application](#running-the-application)
- [How It Works](#how-it-works)
- [Modules Overview](#modules-overview)
- [Database Schema](#database-schema)
- [Sample Demo Data](#sample-demo-data)
- [Testing](#testing)
- [Future Enhancements](#future-enhancements)
- [Documentation](#documentation)
- [License](#license)
- [Author](#author)

---

## About the Project

Cloud-based Model-as-a-Service (MaaS) platforms typically require users to upload **plaintext** data to remote servers for AI inference. This creates serious risks: **inference leakage attacks**, **model inversion**, **membership inference**, and outright **data breaches**.

This project solves the problem at its root. Both the AI model and the user's input data are **encrypted before** they reach the server. The server performs computation on the encrypted payload and returns an **encrypted result** that only the authorized user can decrypt with their private key.

At no point in the pipeline is plaintext exposed to the cloud provider.

> **Use cases:** Secure facial recognition (the included demo identifies cropped face images), healthcare diagnostics, financial risk scoring, biometric authentication, and any AI workload where regulatory compliance (HIPAA, GDPR, PCI-DSS) or data sensitivity is critical.

---

## Key Features

| Feature | Description |
|---|---|
| **End-to-End Encryption** | Data stays encrypted at rest, in transit, **and during computation**. |
| **Zero-Exposure Inference** | The MaaS provider never sees plaintext input, output, or model parameters. |
| **AES-256 CBC + Fernet** | Symmetric AES encryption with PBKDF2 key derivation for robust confidentiality. |
| **Three-Role Architecture** | Distinct flows for Model Owners (Developers), Model Users, and the MaaS Service Provider (Admin). |
| **Secure Key Management** | Public–private key pairs generated and distributed per stakeholder. |
| **Model Inversion Protection** | Adversaries cannot reconstruct model internals from outputs. |
| **Facial Recognition Demo** | Built-in face matching using OpenCV + perceptual hashing (imagehash). |
| **Regulatory Compliance Ready** | Supports HIPAA, GDPR, and PCI-DSS data-handling requirements. |
| **Real-Time Capable** | Optimized inference workflow suitable for facial verification and rapid prediction. |
| **Audit Trail** | Full model-usage history and access logs for accountability. |

---

## System Architecture

The system is built around three actors. Encrypted data flows through the pipeline without any intermediate decryption on the server side.

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
│   │ User Mgmt &  │   │ Key Gen &    │   │ Encrypted    │   │ Encrypted   │  │
│   │ Approval     │ → │ Distribution │ → │ Inference    │ → │ Result Send │  │
│   └──────────────┘   └──────────────┘   └──────────────┘   └─────────────┘  │
│                                                                             │
│   Server NEVER decrypts data, model parameters, or inference outputs        │
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
- **Flask 1.1+** — web framework with session management
- **TensorFlow 2.x** — neural-network inference
- **OpenCV (cv2)** — image processing for facial recognition
- **PyCryptodome (`Crypto`)** — AES encryption (CBC mode)
- **cryptography (Fernet + PBKDF2)** — secondary key derivation layer
- **imagehash + Pillow** — perceptual image hashing for face matching

### Frontend
- **HTML5, CSS3, JavaScript**
- **Bootstrap 4** — responsive, mobile-first UI

### Database
- **MySQL 5.0+** — relational storage for users, models, encrypted records, and audit logs
- Database name: `aiaas_model`

### Infrastructure / Dev Environment
- **WampServer / XAMPP** — local Apache + MySQL stack
- **HTTPS / TLS** — secure transport layer (production)

### Data Science
- **NumPy**, **Pandas**, **Matplotlib**

---

## Project Structure

```
fhe-maas-platform/
│
├── README.md                       # This file
├── LICENSE                         # MIT License
├── CONTRIBUTING.md                 # Contribution guidelines
├── .gitignore                      # Files excluded from version control
├── requirements.txt                # Python dependencies
├── config.example.py               # Configuration template (copy to config.py)
├── main.py                         # Flask application entry point (all routes)
│
├── docs/                           # Project documentation
│   ├── REPORT.md                   # Full project report (abstract → references)
│   ├── ARCHITECTURE.md             # Deep-dive system architecture
│   └── screenshots/                # UI screenshots for documentation
│
├── database/
│   └── aiaas_model.sql             # MySQL dump (8 tables + seed data)
│
├── static/                         # Static assets served by Flask
│   ├── upload/                     # User-uploaded encrypted artifacts
│   ├── model/                      # Deployed encrypted models
│   ├── data/                       # Per-model dataset folders
│   ├── dataset/                    # Training datasets
│   ├── test/                       # Test outputs + result images
│   ├── down/                       # Download-staging folder
│   ├── acc/                        # Accuracy plots
│   ├── crime_data/                 # Demo crime-record dataset
│   └── samples/                    # Sample face images for facial recognition demo
│       ├── cropped_Aaron_Paul_1.jpg
│       ├── cropped_Aaron_Paul_2.jpg
│       ├── cropped_Aaron_Paul_3.jpg
│       └── cropped_Aaron_Paul_7.jpg
│
├── templates/                      # Jinja2 templates
│   ├── index.html, login.html, register.html
│   ├── login_dev.html, login_user.html, reg_dev.html
│   └── web/
│       ├── admin.html, admin2.html, admin3.html, view_user.html
│       ├── dev_home.html, dev_upload.html, dev_upload2.html
│       ├── dev_upload3.html, dev_upload4.html, dev_key.html
│       ├── dev_meta.html, dev_view.html, dev_usage.html
│       ├── userhome.html, user_upload.html, user_upload1.html
│       ├── user_upload2.html, user_upload3.html, user_process.html
│       ├── user_key.html, view_usage.html, view_model.html
│
├── scripts/
│   └── pickle_images.py            # Helper script to pickle a folder of images
│
└── tests/
    └── TEST_CASES.md               # 15 documented test cases (TC001–TC015)
```

---

## Prerequisites

Before installing, ensure you have the following:

- **Python 3.8 or higher**
- **MySQL Server 5.0+** (WampServer or XAMPP recommended for Windows)
- **Git**
- **pip** (Python package manager)

### Hardware (recommended)

| Component | Specification |
|---|---|
| Processor | Intel Core i7 or equivalent |
| RAM | 8 GB minimum |
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

Start MySQL (or WampServer / XAMPP), then import the SQL dump:

```bash
mysql -u root -p < database/aiaas_model.sql
```

This creates the `aiaas_model` database with all 8 required tables (`am_admin`, `am_data`, `am_developer`, `am_label`, `am_model`, `am_test`, `am_user`, `model_metadata`) and seed data including the default admin account.

### 5. Verify database credentials

Open `main.py` and confirm the MySQL connection settings at the top match your local setup:

```python
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",                # add your MySQL password here if set
    charset="utf8",
    database="aiaas_model"
)
```

### 6. Add face image samples to dataset (optional, for demo)

To try the facial-recognition demo, copy the sample images from `static/samples/` into a new dataset folder:

```bash
mkdir -p static/dataset/ENCrimeNet
cp static/samples/*.jpg static/dataset/ENCrimeNet/
```

---

## Running the Application

```bash
python main.py
```

The server starts at **`http://127.0.0.1:5000`** (or `http://0.0.0.0:5000` on your local network).

### Default credentials

| Role | Username | Password |
|---|---|---|
| Admin (MaaS Provider) | `admin` | `admin` |

> **Important:** Change the admin password before deploying to production.

---

## How It Works

The end-to-end encrypted inference workflow:

1. **Registration & Approval** — Model Owners and Model Users register at `/reg_dev` and `/register` respectively. The MaaS Provider (Admin) approves each account from the `/admin` dashboard.
2. **Key Generation** — On approval, the system generates a per-user public/private key pair using PBKDF2 + AES-256 derivation.
3. **Model Encryption** — The Model Owner encrypts model features with their public key at `/dev_upload` and uploads the encrypted model.
4. **Input Encryption** — The Model User encrypts their input image at `/user_upload` using AES-CBC before transmission.
5. **Encrypted Inference** — The server runs facial-recognition matching on ciphertext via `/user_process`. No decryption occurs server-side.
6. **Encrypted Output Delivery** — The result, still encrypted, is sent back to the user.
7. **Local Decryption** — The user submits their private key at `/user_key` to decrypt the result. Only they can see the plaintext output.

---

## Modules Overview

| # | Module | Route(s) | Responsibility |
|---|---|---|---|
| 1 | **MaaS Service Provider** | `/admin`, `/admin2`, `/admin3`, `/view_user` | User approval, monitoring, key oversight |
| 2 | **Model Owner Module** | `/reg_dev`, `/login_dev`, `/dev_home`, `/dev_upload`, `/dev_meta` | Registration, login, model upload + metadata |
| 3 | **Model User Module** | `/register`, `/login_user`, `/userhome`, `/user_upload`, `/user_process` | Registration, login, encrypted query submission |
| 4 | **Key Generation Module** | `/dev_key`, `/user_key` | Public/private key generation + distribution |
| 5 | **Data Encryption Module** | (internal `AESCipher` class) | AES-256 CBC encryption of model features & user inputs |
| 6 | **AI Model Evaluation Module** | `/user_process` | Encrypted facial recognition inference |
| 7 | **Result Decryption Module** | `/user_key` | Validates private key, returns decrypted result |

---

## Database Schema

The system uses 8 MySQL tables:

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

Full schema with seed data in [`database/aiaas_model.sql`](database/aiaas_model.sql).

---

## Sample Demo Data

The `static/samples/` folder contains 4 cropped face images (Aaron Paul) used to demonstrate the facial-recognition inference workflow. To run the demo:

1. Log in as Admin → approve a Model Owner and Model User
2. As the Model Owner, upload a facial-recognition model at `/dev_upload`
3. As the Model User, upload one of the sample images at `/user_upload`
4. Submit your private key at `/user_key` to decrypt and view the prediction

You can replace these with your own dataset (e.g. CelebA, LFW) for production use.

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

## Future Enhancements

- **Mobile-Friendly UI** — Responsive React Native or PWA frontend
- **Multi-Model Support** — Deep neural networks, transformers, and ensemble models
- **Blockchain Audit Trail** — Immutable logging via Ethereum/Hyperledger
- **GPU Acceleration** — CUDA-backed cryptographic operations for sub-second inference
- **Cloud-Native Deployment** — Kubernetes + Docker for horizontal scaling
- **Multi-Tenant Key Vault** — HSM-backed key management

---

## Documentation

- [Full Project Report](docs/REPORT.md) — Abstract, problem statement, system analysis, design, implementation, and conclusion
- [Architecture Deep Dive](docs/ARCHITECTURE.md) — DFDs, UML diagrams, ER diagrams
- [Test Cases](tests/TEST_CASES.md) — All 15 test scenarios and outcomes

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## Author

**[SURENDHAR S]**

- GitHub: [https://github.com/Surendharsure46/FHE-Maas-Platform.git]
- LinkedIn: [www.linkedin.com/in/surendhar-s-765b132bb]
- Email: s.surendharsure2004@gmail.com

---

<div align="center">

**If you found this project useful, please consider giving it a star.**

*Built with the goal of making privacy-preserving AI practical and accessible.*

</div>
