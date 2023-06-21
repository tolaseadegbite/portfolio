Rails.application.routes.draw do
  resources :tags
  devise_for :users
  root "static_pages#home"

  resources :usernames, only: [:new, :update]
  resources :projects do
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  resources :users, only: :show
  resources :posts do
    resources :comments
  end
end
