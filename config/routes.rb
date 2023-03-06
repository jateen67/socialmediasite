Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  resources :communities do
    resources :posts do
      resources :comments
    end
  end
  resources :likes, only: [:create, :destroy]
  resources :subscriptions, only: [:create, :destroy]
  root 'home#index'
end
