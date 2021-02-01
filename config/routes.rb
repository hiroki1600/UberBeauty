Rails.application.routes.draw do
  root to: 'infos#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :items
end