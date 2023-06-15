# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#blog"
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Additional routes...
end
