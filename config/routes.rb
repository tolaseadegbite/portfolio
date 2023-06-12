Rails.application.routes.draw do
  resources :tags
  devise_for :users
  root "static_pages#home"

  resources :usernames, only: [:new, :update]
  resources :projects
  resources :likes, only: [:create, :destroy]
  # resources :tags
end
