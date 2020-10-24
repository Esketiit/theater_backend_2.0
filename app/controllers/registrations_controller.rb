class RegistrationsController < ApplicationController

    def create
        # take user input from front end to create new user 
        user = User.create!(
            username: params['user']['username'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation']
        )

        # if user is created, create new session
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user
            }
        else
            # status code 500 = internal server error
            render json: {errors: user.errors.full_messages}
        end
    end
end
