# Contributing Guidelines

Thanks for your interest in contributing to the **FHE-MaaS Platform**! This document explains how to propose changes, report issues, and submit pull requests.

---

## Code of Conduct

Be respectful, constructive, and professional. Personal attacks, harassment, or discriminatory language will not be tolerated.

---

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:

1. A clear, descriptive title
2. Steps to reproduce
3. Expected vs. actual behavior
4. Environment details (OS, Python version, MySQL version)
5. Screenshots or error logs (if applicable)

### Suggesting Enhancements

Open an issue tagged `enhancement` with:

1. The problem your idea solves
2. A clear proposal
3. Alternatives you considered

### Pull Requests

1. **Fork** the repository
2. **Create a feature branch**: `git checkout -b feature/your-feature-name`
3. **Commit** your changes with descriptive messages: `git commit -m "feat: add X module"`
4. **Push** to your fork: `git push origin feature/your-feature-name`
5. **Open a Pull Request** against `main` with a clear description

---

## Development Setup

```bash
git clone https://github.com/<your-username>/fhe-maas-platform.git
cd fhe-maas-platform
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
mysql -u root -p < database/schema.sql
```

---

## Coding Standards

- Follow **PEP 8** for Python code
- Use **meaningful variable names** — `encrypted_payload`, not `ep`
- Add **docstrings** to every function and class
- Keep functions **small and single-purpose**
- Write **unit tests** for new functionality
- **Never commit** API keys, passwords, or private encryption keys

---

## Commit Message Format

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat:     A new feature
fix:      A bug fix
docs:     Documentation only changes
style:    Code style changes (no logic change)
refactor: Code restructure without behavior change
test:     Adding or updating tests
chore:    Build, tooling, or dependency changes
```

Example: `feat(encryption): add batch FHE encryption helper`

---

## Security

If you discover a security vulnerability, **do not** open a public issue. Email the maintainer directly at `your.email@example.com`.

---

## License

By contributing, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).
