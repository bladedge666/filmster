Rails.application.routes.draw do
  devise_for :users
  root 'static#index'

  resources :reviews

  resources :movies, only: :show

end
