Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/tournaments', to: 'tournaments#index'
  get '/tournaments/:id', to: 'tournaments#show'
  get '/discgolfers', to: 'discgolfers#index'
end
