# Templates Folder

This folder holds all Jinja2 / HTML templates rendered by `main.py`. The application code references the following template files — **place them in this folder** before running the app.

## Templates expected at root of `templates/`

| File | Used by route(s) |
|---|---|
| `index.html` | `/` |
| `login.html` | `/login` (admin) |
| `login_dev.html` | `/login_dev` |
| `login_user.html` | `/login_user` |
| `reg_dev.html` | `/reg_dev` |
| `register.html` | `/register` |

## Templates expected in `templates/web/`

| File | Used by route(s) |
|---|---|
| `admin.html` | `/admin` |
| `admin2.html` | `/admin2` |
| `admin3.html` | `/admin3` |
| `view_user.html` | `/view_user` |
| `dev_home.html` | `/dev_home` |
| `dev_upload.html` | `/dev_upload` |
| `dev_upload2.html` | `/dev_upload2` |
| `dev_upload3.html` | `/dev_upload3` |
| `dev_upload4.html` | `/dev_upload4` |
| `dev_key.html` | `/dev_key` |
| `dev_meta.html` | `/dev_meta` |
| `dev_view.html` | `/dev_view` |
| `dev_usage.html` | `/dev_usage` |
| `userhome.html` | `/userhome` |
| `user_upload.html` | `/user_upload` |
| `user_upload1.html` | `/user_upload1` |
| `user_upload2.html` | `/user_upload2` |
| `user_upload3.html` | `/user_upload3` |
| `user_process.html` | `/user_process` |
| `user_key.html` | `/user_key` |
| `view_usage.html` | `/view_usage` |
| `view_model.html` | `/view_model` |

## Action required

Copy your existing HTML template files from your local project into this folder before pushing to GitHub.
