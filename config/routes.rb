Rails.application.routes.draw do

get 'welcome/index'
get 'welcome/about', as: 'about'

resources :links
resources :users
resources :comments
resources :boards

get 'login', to: 'sessions#new', as: 'login'
post 'login', to: 'sessions#create', as: 'create_session'
get 'logout', to: 'sessions#destroy', as: 'logout'

 root 'welcome#index'
end
