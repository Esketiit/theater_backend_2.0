# This is where the structure of our cookies are defined
Rails.application.config.session_store :cookie_store, key: "_auth_app", domain: "http://localhost:3000/"