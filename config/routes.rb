Rails.application.routes.draw do
  devise_for :admins
  
  root 'posts#index'
  
  devise_for :users

  resources :posts do
    resource :map
    resources :charges
    resources :likes

  end

  resources :users do
    resources :likes
  end

  resources :tags
  resources :orders


end
