Rails.application.routes.draw do


	root 'home#index'

	get 'home/about' => 'home#show'

	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
