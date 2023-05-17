Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/tournaments', to: 'tournaments#index'
  get "/tournaments/new", to: 'tournaments#new'
  get '/tournaments/:id', to: 'tournaments#show'
  get '/discgolfers', to: 'discgolfers#index'
  get '/discgolfers/:id', to: 'discgolfers#show'
  get "/tournaments/:tournament_id/discgolfers", to: 'tournament_discgolfers#index'
  post "/tournaments", to: 'tournaments#create'
  get "/tournaments/:id/edit", to: "tournaments#edit"
  patch '/tournaments/:id', to: "tournaments#update"
  get "/tournaments/:id/discgolfers/new", to: 'tournament_discgolfers#new'
  post "/tournaments/:id/discgolfers", to: 'tournament_discgolfers#create'
  get "/discgolfers/:id/edit", to: 'discgolfers#edit'
  patch "/discgolfers/:id", to: 'discgolfers#update'
end
