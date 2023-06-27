# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      post 'like', on: :member
  end
end
  # Define your other application routes here
end
