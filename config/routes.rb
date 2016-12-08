Rails.application.routes.draw do
  devise_for :users
  root 'static#index'

  resources :reviews

  resources :movies, only: :show

  resources :users, only: :show do
  # get "users/:id" => "users#show", as: :user do #alternative
    resources :relationships
  end
  
end
