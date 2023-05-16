Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bars", to: "bars#index"
  get "/bars/new", to: "bars#new"
  post "/bars", to: "bars#create"
  get "/bars/:id/edit", to: "bars#edit"
  get "/bars/:id/kegs/new", to: "bars/kegs#new"
  post "/bars/:id/kegs", to: "bars/kegs#create"
  get "/kegs", to: "kegs#index"
  get "/kegs/:id/edit", to: "kegs#edit"
  get "/kegs/:id", to: "kegs#show"
  get "/kegs/:id/edit", to: "cars#edit"
  get "/bars/:id", to: "bars#show"
  get "/bars/:id/kegs", to: "bars/kegs#index"
  patch "/kegs/:id", to: "kegs#update"
  patch "/bars/:id", to: "bars#update"
end
