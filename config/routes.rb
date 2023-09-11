require 'sidekiq/web'

Rails.application.routes.draw do
  get '/currencies/new', to: 'currencies#new', as: 'new_currency'
  post '/currencies/upload', to: 'currencies#upload'
  resources :currencies, only: [:index, :create]
  mount Sidekiq::Web => '/sidekiq'
  root "currencies#index"
end
