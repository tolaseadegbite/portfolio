Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :usernames, only: [:new, :update]
  resources :projects
  resources :likes, only: [:create, :destroy]
end
