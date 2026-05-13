"""
Application Configuration
=========================

Edit this file with your local credentials BEFORE running the application.
For production, override these values via environment variables.
"""

import os

# ============================================================
# Flask Configuration
# ============================================================
SECRET_KEY = os.environ.get("SECRET_KEY", "change-me-in-production")
DEBUG = os.environ.get("FLASK_DEBUG", "True").lower() == "true"
HOST = "127.0.0.1"
PORT = 5000

# ============================================================
# Database Configuration (MySQL)
# ============================================================
DB_HOST = os.environ.get("DB_HOST", "localhost")
DB_USER = os.environ.get("DB_USER", "root")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "")
DB_NAME = os.environ.get("DB_NAME", "MaaS_model")
DB_CHARSET = "utf8mb4"

# ============================================================
# File Upload Paths
# ============================================================
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
UPLOAD_FOLDER = os.path.join(BASE_DIR, "..", "static", "uploads")
MODEL_FOLDER = os.path.join(BASE_DIR, "..", "static", "model")
DATASET_FOLDER = os.path.join(BASE_DIR, "..", "static", "dataset")
DOWNLOAD_FOLDER = os.path.join(BASE_DIR, "..", "static", "down")

MAX_CONTENT_LENGTH = 50 * 1024 * 1024  # 50 MB

# ============================================================
# FHE (Microsoft SEAL / BFV scheme) Parameters
# ============================================================
FHE_POLY_MODULUS_DEGREE = 4096
FHE_PLAIN_MODULUS = 1024
FHE_SECURITY_LEVEL = 128  # bits

# ============================================================
# Security
# ============================================================
MAX_FAILED_LOGIN_ATTEMPTS = 3
SESSION_TIMEOUT_MINUTES = 30
