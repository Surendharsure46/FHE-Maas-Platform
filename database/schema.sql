-- ============================================================
-- FHE-MaaS Platform — Database Schema
-- ============================================================
-- Privacy-Preserving Model-as-a-Service using
-- Fully Homomorphic Encryption (FHE)
-- ============================================================

CREATE DATABASE IF NOT EXISTS MaaS_model
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE MaaS_model;

-- ============================================================
-- 1. Admin (MaaS Service Provider)
-- ============================================================
CREATE TABLE IF NOT EXISTS am_admin (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    email       VARCHAR(100),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Seed default admin (CHANGE BEFORE PRODUCTION)
INSERT INTO am_admin (username, password, email)
VALUES ('admin', 'admin', 'admin@example.com');

-- ============================================================
-- 2. Model Owners (Developers)
-- ============================================================
CREATE TABLE IF NOT EXISTS am_developer (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    mobile       VARCHAR(20),
    email        VARCHAR(100),
    location     VARCHAR(100),
    country      VARCHAR(100),
    uname        VARCHAR(50)  NOT NULL UNIQUE,
    pass         VARCHAR(255) NOT NULL,
    create_date  VARCHAR(20),
    public_key   TEXT,
    private_key  TEXT,
    status       TINYINT DEFAULT 0,
    INDEX idx_uname (uname)
);

-- ============================================================
-- 3. Model Users (Clients)
-- ============================================================
CREATE TABLE IF NOT EXISTS am_user (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    mobile       VARCHAR(20),
    email        VARCHAR(100),
    location     VARCHAR(100),
    country      VARCHAR(100),
    uname        VARCHAR(50)  NOT NULL UNIQUE,
    pass         VARCHAR(255) NOT NULL,
    create_date  VARCHAR(20),
    public_key   TEXT,
    private_key  TEXT,
    status       TINYINT DEFAULT 0,
    INDEX idx_uname (uname)
);

-- ============================================================
-- 4. Encrypted AI Models
-- ============================================================
CREATE TABLE IF NOT EXISTS am_model (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    model_file   VARCHAR(255) NOT NULL,
    model_id     VARCHAR(50)  NOT NULL,
    owner        VARCHAR(50),
    public_key   TEXT,
    private_key  TEXT,
    upload_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_owner (owner)
);

-- ============================================================
-- 5. Encrypted Training Labels per Model
-- ============================================================
CREATE TABLE IF NOT EXISTS am_label (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    mid           INT NOT NULL,
    label_name    VARCHAR(100),
    name          TEXT,
    dob           TEXT,
    gender        TEXT,
    crime_type    TEXT,
    details       TEXT,
    crime_date    TEXT,
    status        TEXT,
    address       TEXT,
    enc_st        TINYINT DEFAULT 0,
    INDEX idx_mid (mid)
);

-- ============================================================
-- 6. Encrypted User-Submitted Data
-- ============================================================
CREATE TABLE IF NOT EXISTS am_data (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    mid          INT NOT NULL,
    uname        VARCHAR(50),
    filename     VARCHAR(255),
    hash1        VARCHAR(255),
    label        VARCHAR(100),
    upload_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_mid (mid),
    INDEX idx_hash (hash1)
);

-- ============================================================
-- 7. Inference Test Results
-- ============================================================
CREATE TABLE IF NOT EXISTS am_test (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    uname        VARCHAR(50),
    mid          INT,
    score        VARCHAR(20),
    status       VARCHAR(20),
    remarks      TEXT,
    test_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_uname (uname)
);

-- ============================================================
-- 8. Model Metadata
-- ============================================================
CREATE TABLE IF NOT EXISTS model_metadata (
    id                     INT AUTO_INCREMENT PRIMARY KEY,
    model_id               VARCHAR(50) NOT NULL UNIQUE,
    model_name             VARCHAR(100),
    model_version          VARCHAR(20),
    model_owner_id         VARCHAR(50),
    model_description      TEXT,
    model_type             VARCHAR(50),
    input_type             VARCHAR(50),
    output_type            VARCHAR(50),
    model_algorithm        VARCHAR(100),
    training_dataset       VARCHAR(255),
    model_accuracy         VARCHAR(20),
    evaluation_metrics     TEXT,
    homomorphic_encryption VARCHAR(50),
    encryption_status      VARCHAR(20),
    deployment_date        VARCHAR(20),
    access_permissions     VARCHAR(100),
    license_type           VARCHAR(50),
    compliance_status      VARCHAR(50)
);

-- ============================================================
-- End of Schema
-- ============================================================
