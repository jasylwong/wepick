Rails.application.routes.draw do
  devise_for :users

  resources :friendships do
    member do
      put "add" => "friendships#add"
    end
  end
  
  resources :users
  resources :games

  root 'friendships#index'
  
  post '/friendships/new', to: 'friendships#create'
  
end
