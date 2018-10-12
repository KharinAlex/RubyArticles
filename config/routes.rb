Rails.application.routes.draw do
  get 'home/index'
  get 'home/about'
  
  root 'home#index'

  resources :users
  resources :articles
  resources :comments, only: [:update, :create, :destroy, :new, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
