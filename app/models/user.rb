class User < ApplicationRecord
    has_secure_password 

    validates_presence_of :username
    validates_uniqueness_of :username

    # Saving emails for later 
    # validates presence_of :email
    # validates uniqueness_of :email
end
