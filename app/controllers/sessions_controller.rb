class SessionsController < ApplicationController
    def create
        # frontend makes a post request to create new session
        # The frontend will send a user object
        
        # first, see if there is a user with a paticular username(line 8)
        # now that we found the user in the database, try to run the authenticate method on the password 
        # sent from the frontend
        # if both of these steps work, user will have ref a User object, otherwise, a falsey value (I think)
        user = User.find_by(username: params["user"]["username"]).try(:autheticate, params["user"]["username"])

        # if a user has been found and authenticated, store the id of that user
        # in the session cookie, then send send back the user's data
        # if a user hasn't been found, send back a 401 status(Unauthorized client error)
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: {status: 401}
        end
    end
end
