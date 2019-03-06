Rails.application.routes.draw do
  devise_for :users
  resources :nodes
  root to: 'nodes#index'
end
