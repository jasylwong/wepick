Rails.application.routes.draw do
  devise_for :users
  resources :friendships
  resources :users
  root 'friendships#index'
  post '/friendships/new', to: 'friendships#create'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
