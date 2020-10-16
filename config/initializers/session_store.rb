# This is where the structure of our cookies are defined
# This if statement checks the enviornment to see if it's still in development or in production
# line 5: domain needs be changed before being deployed
if Rails.env === "production"
    Rails.application.config.session_store :cookie_store, key: "_auth_app", domain: "http://localhost:3001/"
else 
    Rails.application.config.session_store :cookie_store, key: "_auth_app"
end

