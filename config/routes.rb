Rails.application.routes.draw do
  get 'friendship/index'
  get 'friendship/create'
  get 'friendship/new'
  get 'friendship/edit'
  get 'friendship/show'
  get 'friendship/update'
  get 'friendship/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
