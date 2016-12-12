Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  get 'timeline' => "static#timeline", as: :timeline

  resources :reviews do
    resources :upvotes, only: :create
  end
  
  resources :movies, only: :show

  resources :users, only: :show do
  # get "users/:id" => "users#show", as: :user do #alternative
    resources :relationships
  end
  
end
