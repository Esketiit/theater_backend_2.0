Rails.application.routes.draw do
  # sessions route for authentications and cookie creation
  resources :sessions, only: [:create]
  # registrations route that allows users to create accounts
  resources :registrations, only: [:create]
  # allows user to logout
  delete :logout, to: "sessions#logout"
  # checks to see if user is logged in
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
end
