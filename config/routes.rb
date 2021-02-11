Rails.application.routes.draw do
  get 'session/new'

  get 'home/index'
  get 'home/about'
  get '/forbidden', to: 'home#forbidden'
  
  get    '/profile',       to: 'users#show'
  get    '/profile/edit',  to: 'users#edit'
  patch  '/profile/edit',  to: 'users#update'
  delete '/profile',       to: 'users#destroy'
  
  get    '/edit/password', to: 'users#edit_password'
  patch  '/edit/password', to: 'users#update_password'

  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'

  root 'home#index'

  resources :users, only: [:new, :create]
  resources :articles
  resources :comments, only: [:update, :create, :destroy, :new, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
