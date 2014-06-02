Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :likes
  end
  resources :users do
    resources :likes
  end

  resources :tags


end
