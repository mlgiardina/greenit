Rails.application.routes.draw do

get 'welcome/index'

resources :links
resources :users
resources :comments
resources :boards
resources :votes
resources :downvotes

get 'login', to: 'sessions#new', as: 'login'
post 'login', to: 'sessions#create', as: 'create_session'
get 'logout', to: 'sessions#destroy', as: 'logout'

root 'links#index'
end
