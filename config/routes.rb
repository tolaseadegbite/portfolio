Rails.application.routes.draw do
  resources :tags
  devise_for :users
  root "static_pages#home"

  resources :usernames, only: [:new, :update]

  resources :projects do
    resources :comments
  end
  
  resources :posts do
    resources :comments
  end

  resources :likes, only: [:create, :destroy]

  resources :users

 get '/:username', to: 'profiles#show', as: :profile
 get '/:username/comments', to: 'profiles#profile_comments', as: :profile_comments
 patch '/:username/edit', to: 'profiles#update', as: :update_profile

end
