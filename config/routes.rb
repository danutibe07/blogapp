Rails.application.routes.draw do
  get 'home/index'

  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' , sessions: 'sessions' }

  # Add the following route for signing out
  delete '/sign_out', to: 'sessions#destroy', as: :custom_destroy_user_session

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :custom_login
    post 'login', to: 'devise/sessions#create', as: :custom_user_session

    get 'registration', to: 'devise/registrations#new', as: :custom_registration
    post 'registration', to: 'devise/registrations#create', as: :custom_user_registration
  end


  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do 
      resources :comments, only: [:create, :new]
      post 'like', on: :member
    end  
 end

 resources :posts
 resources :comments, only: [:destroy]

 root 'home#index'
#  get 'posts', to: 'posts#index'
end