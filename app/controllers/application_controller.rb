class ApplicationController < ActionController::Base
    # tells rails to skip generating csrf token(LOOK IT UP)
    # we don't need that since cookie/sessions will be handled in react)
    skip_before_action :verify_authenticity_token
end
