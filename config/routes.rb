Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/kegs", to: "kegs#index"
  get "/kegs/:id", to: "kegs#show"
  get "/bars/:id/kegs", to: "bars/kegs#index"
  get "/bars", to: "bars#index"
  get "/bars/new", to: "bars#new"
  get "/bars/:id", to: "bars#show"
  post "/bars", to: "bars#create"
end
