# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"

  get '/users/:user_id/posts', to: 'posts#index', as: 'posts'
  get '/users/:user_id/posts(/:id)', to: 'posts#show', as: 'post'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show], module: :users
  end

  # Define your other application routes here
end
