class StaticController < ApplicationController
    def home 
    render json: { status: "test is workin!"}
    end
end