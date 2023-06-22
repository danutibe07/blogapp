# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      post 'like', on: :member
      # resources :likes, only: [:create]
  end
end
  resources :posts do

  end
  
  # Define your other application routes here
end
