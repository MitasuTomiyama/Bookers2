Rails.application.routes.draw do

  get 'home/show'
  get 'home/index'
  get 'show/index'
  root 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :edit, :show, :update, :destry]

  resources :users, only: [:index, :show, :edit, :update]
end
