Rails.application.routes.draw do
  devise_for :users

  resources :friendships do
    member do
      put "add" => "friendships#add"
    end
  end
  
  resources :users
  
  resources :games do
  end

  root 'friendships#index'
  
  post '/games/like', to: 'games#like'
  post '/games/dislike', to: 'games#dislike'
  post '/friendships/new', to: 'friendships#create'
  
end
