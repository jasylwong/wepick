Rails.application.routes.draw do
  root 'friendships#index'
  post 'friendships/new'
  get 'friendships/create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
