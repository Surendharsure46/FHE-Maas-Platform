"""
FHE-MaaS Platform — Flask Application Entry Point
=================================================

Privacy-Preserving Model-as-a-Service using Fully Homomorphic Encryption.

Replace the placeholder routes below with your existing source code from the
project report (Section 8.2). Move route handlers into src/routes/ and helper
functions into src/utils/ and src/encryption/ as appropriate.
"""

from flask import Flask
import config


def create_app():
    app = Flask(
        __name__,
        template_folder="../templates",
        static_folder="../static",
    )
    app.secret_key = config.SECRET_KEY
    app.config["MAX_CONTENT_LENGTH"] = config.MAX_CONTENT_LENGTH

    # ---------------------------------------------------------
    # Register Blueprints (uncomment after splitting your routes)
    # ---------------------------------------------------------
    # from routes.admin import admin_bp
    # from routes.owner import owner_bp
    # from routes.user  import user_bp
    #
    # app.register_blueprint(admin_bp, url_prefix="/admin")
    # app.register_blueprint(owner_bp, url_prefix="/owner")
    # app.register_blueprint(user_bp,  url_prefix="/user")

    @app.route("/")
    def index():
        return (
            "FHE-MaaS Platform is running. "
            "Move your existing source code from the project report into this skeleton."
        )

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(host=config.HOST, port=config.PORT, debug=config.DEBUG)
