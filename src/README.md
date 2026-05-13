# Source Code Layout

This folder is the skeleton for your existing source code. Here's where each piece from your project report (Section 8.2) should go:

| From the Report | Place in |
|---|---|
| `Packages` imports + Flask setup | `src/app.py` (already started for you) |
| `Database Connection` block | `src/config.py` + a `src/utils/db.py` helper |
| `Login()` function | `src/routes/admin.py` (admin login) and `src/routes/user.py` |
| `register()` (Model Owner) | `src/routes/owner.py` |
| `FHE_keygen()`, `encrypt_file()`, `decrypt_file()` | `src/encryption/fhe_keygen.py` (already started) |
| `dev_upload()` (Deploy Model) | `src/routes/owner.py` |
| `dev_meta()` (Add Model Metadata) | `src/routes/owner.py` |
| `user_process()` (Model Test & Prediction) | `src/routes/user.py` |
| All HTML templates | `templates/` (split into `admin/`, `owner/`, `user/`) |
| CSS / JS / images | `static/css/`, `static/js/`, `static/images/` |

## Recommended next steps

1. Copy your full source code (from your local machine) into these folders following the table above.
2. Wire up the Blueprints in `app.py` by uncommenting the `register_blueprint` lines.
3. Run `python app.py` and verify the server starts.
4. Commit and push.

## Security reminder

Before pushing, double-check that NO credentials, API keys, or private SEAL keys are in your code. Use environment variables (via `config.py`) for anything sensitive. The `.gitignore` already excludes `.env`, `*.pem`, `*.key`, and the `keys/` folder.
