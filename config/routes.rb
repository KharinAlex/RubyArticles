Rails.application.routes.draw do
  get 'home/index'
  get 'home/about'
  
  root 'home#index'

  resources :users
  resources :news, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
