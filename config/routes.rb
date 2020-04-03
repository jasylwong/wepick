Rails.application.routes.draw do
  devise_for :users

  resources :friendships do
    member do
      put "add" => "friendships#add"
    end
  end
  
  resources :users
  
  root 'friendships#index'
  
  post '/friendships/new', to: 'friendships#create'
  
  get "/movies/:id", to: "movies#index"
end
