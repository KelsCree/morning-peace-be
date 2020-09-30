Rails.application.routes.draw do
  resources :sessions
  resources :entries
  resources :users
  get '/profile', to: 'users#profile'
  post '/login', to: 'users#login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
