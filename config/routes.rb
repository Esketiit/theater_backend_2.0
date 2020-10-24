Rails.application.routes.draw do
  resources :room_playlists, only: [:create, :destroy]
  resources :playlists
  resources :comments, only: [:create, :destroy]
  resources :rooms
  resources :videos
  # sessions route for authentications and cookie creation
  resources :sessions, only: [:create]
  # registrations route that allows users to create accounts
  resources :registrations, only: [:create]
  # allows user to logout
  delete :logout, to: "sessions#logout"
  # checks to see if user is logged in
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

  # actioncable routes
  resources :comments, only: [:create]
  mount ActionCable.server => '/cable'
end
