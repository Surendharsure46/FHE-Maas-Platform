"""
Fully Homomorphic Encryption — Key Generation
=============================================

Wraps Microsoft SEAL (via PySEAL) to produce BFV-scheme key pairs used
throughout the platform.

PySEAL build instructions: https://github.com/Huelse/SEAL-Python
"""

import base64

try:
    import seal
except ImportError:
    seal = None  # PySEAL not installed; functions will raise at call time


def _require_seal():
    if seal is None:
        raise ImportError(
            "PySEAL is not installed. Build it from "
            "https://github.com/Huelse/SEAL-Python and add it to your Python path."
        )


def build_context(poly_modulus_degree: int = 4096, plain_modulus: int = 1024):
    """Build a SEAL BFV context with sensible defaults."""
    _require_seal()
    parms = seal.EncryptionParameters(seal.scheme_type.BFV)
    parms.set_poly_modulus_degree(poly_modulus_degree)
    parms.set_coeff_modulus(seal.CoeffModulus.BFVDefault(poly_modulus_degree))
    parms.set_plain_modulus(plain_modulus)
    return seal.SEALContext(parms)


def generate_keypair(context):
    """Generate a public/private key pair from a SEAL context."""
    _require_seal()
    keygen = seal.KeyGenerator(context)
    public_key = keygen.public_key()
    secret_key = keygen.secret_key()
    return public_key, secret_key


def build_cipher_tools(context, public_key, secret_key):
    """Return the encryptor, decryptor, evaluator, and integer encoder."""
    _require_seal()
    encryptor = seal.Encryptor(context, public_key)
    decryptor = seal.Decryptor(context, secret_key)
    evaluator = seal.Evaluator(context)
    encoder = seal.IntegerEncoder(context)
    return encryptor, decryptor, evaluator, encoder


def encrypt_file(input_path: str, output_path: str, encryptor, encoder) -> None:
    """Encrypt a plaintext file line-by-line into base64-encoded ciphertext."""
    _require_seal()
    with open(input_path, "r", encoding="utf-8") as f, open(output_path, "w", encoding="utf-8") as out:
        for line in f:
            for word in line.strip().split():
                num = sum(ord(c) for c in word)
                plain = encoder.encode(num)
                cipher = seal.Ciphertext()
                encryptor.encrypt(plain, cipher)
                out.write(base64.b64encode(cipher.save()).decode() + "\n")


def decrypt_file(encrypted_path: str, context, decryptor, encoder):
    """Decrypt a base64-encoded ciphertext file back into integers."""
    _require_seal()
    results = []
    with open(encrypted_path, "r", encoding="utf-8") as f:
        for line in f:
            cipher = seal.Ciphertext()
            cipher.load(context, base64.b64decode(line.strip()))
            plain = seal.Plaintext()
            decryptor.decrypt(cipher, plain)
            results.append(encoder.decode_int32(plain))
    return results
