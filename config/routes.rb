Rails.application.routes.draw do
  # sessions route for authentications and cookie creation
  resources :sessions, only: [:create]
  # registrations route that allows users to create accounts
  resources :registrations, only: [:create]
  root to: "static#home"
end
