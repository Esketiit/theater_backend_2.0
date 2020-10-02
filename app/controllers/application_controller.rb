class ApplicationController < ActionController::Base
    # tells rails to skip generating csrf token(basically makes sure a user typing into a rails form 
    # isn't being hijacked, but we don't need that since all of that will be happening in react)
    skip_before_action :verify_authenticity_token
end
