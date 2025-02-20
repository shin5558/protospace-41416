Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :prototypes do
    resources :comments, only: :create
  end

  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show, :edit ,:update ,:destroy]
  resources :users, only: [:show]
end
