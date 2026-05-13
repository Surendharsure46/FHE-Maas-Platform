# Quick Setup Guide

A condensed checklist for getting the project running locally and pushed to GitHub.

---

## Part A — Run Locally

### 1. Prerequisites

- Python 3.8+
- MySQL 5.0+ (WampServer / XAMPP recommended on Windows)
- Git

### 2. Install dependencies

```bash
python -m venv venv

# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate

pip install -r requirements.txt
```

### 3. Set up MySQL

Start MySQL/WampServer and import the dump:

```bash
mysql -u root -p < database/aiaas_model.sql
```

This creates the `aiaas_model` database with 8 tables and seed data.

### 4. Configure DB credentials

Open `main.py` (lines 52–58) and update if your MySQL has a password:

```python
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",            # ← add your MySQL password here
  charset="utf8",
  database="aiaas_model"
)
```

### 5. Add HTML templates

Copy your existing HTML template files into the `templates/` folder. See [`templates/README.md`](templates/README.md) for the full list of expected files.

### 6. Run the server

```bash
python main.py
```

Open `http://127.0.0.1:5000` in your browser.

### 7. Default login

- **Admin:** username `admin`, password `admin`

---

## Part B — Push to GitHub

### Step 1 — Create the GitHub repo

1. Go to https://github.com/new
2. Repository name: `fhe-maas-platform`
3. Description: *Privacy-Preserving Model-as-a-Service using Fully Homomorphic Encryption*
4. Public
5. **UNCHECK** all three: README, .gitignore, License (your project already has them)
6. Click **Create repository**

### Step 2 — Personalize 2 files

- **`README.md`** — bottom section, replace `[Your Full Name]`, `@your-username`, LinkedIn, email
- **`LICENSE`** — line 3, replace `[Your Full Name]`

### Step 3 — Push from terminal

```bash
cd path/to/fhe-maas-platform

git init
git add .
git commit -m "Initial commit: FHE-MaaS platform with full documentation"

git branch -M main
git remote add origin https://github.com/<your-username>/fhe-maas-platform.git
git push -u origin main
```

If GitHub asks for credentials, use your GitHub username + a **Personal Access Token** (Settings → Developer settings → Personal access tokens).

### Step 4 — Polish the GitHub page

- Click the gear icon next to "About" → add description and topics:
  ```
  fhe, homomorphic-encryption, privacy-preserving-ml, flask, python,
  tensorflow, cybersecurity, maas, machine-learning, cloud-security
  ```
- Pin the repo to your profile (Profile → Customize your pins)

---

## Part C — Add Screenshots (later)

When you have UI screenshots:

```bash
# Drop screenshots into docs/screenshots/
git add docs/screenshots/
git commit -m "docs: add UI screenshots"
git push
```

Then update the README to reference them.

---

## Security Checklist Before Pushing

- [ ] No real passwords in `main.py` (the default empty MySQL password is fine for local dev)
- [ ] No private SEAL/AES keys committed
- [ ] No `.env` files committed
- [ ] No personal API tokens in code
- [ ] `.gitignore` already excludes the above by default

You're good to go.
