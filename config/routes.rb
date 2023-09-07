require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/currencies/new', to: 'currencies#new', as: 'new_currency'
  resources :currencies, only: [:index, :create]
  mount Sidekiq::Web => '/sidekiq'
  # Defines the root path route ("/")
  root "currencies#index"
end
