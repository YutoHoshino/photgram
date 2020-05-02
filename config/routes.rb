Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' } 

  root 'posts#index'

  namespace :posts do
    resources :searches, only: :index
  end

  resources :users, only: [:show]
  
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
