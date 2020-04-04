Rails.application.routes.draw do
  devise_for :users

  resources :friendships do
    member do
      put "add" => "friendships#add"
    end
  end
  
  resources :users
  
  resources :games do
    # member do
    #   put "like" => "games#like"
    # end
  end

  root 'friendships#index'
  
  post '/games/like', to: 'games#like'
  post '/friendships/new', to: 'friendships#create'
  
end
