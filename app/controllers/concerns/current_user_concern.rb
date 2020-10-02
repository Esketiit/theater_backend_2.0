module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
        # before every action run set_current_user
        before_action :set_current_user
    end

    def set_current_user
        # if a session exists, set current user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end
end