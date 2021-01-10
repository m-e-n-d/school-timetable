Rails.application.routes.draw do
  
  root 'top#index'

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  get    '/logout', to: "sessions#destroy"

  resources :periods
  resources :users, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
