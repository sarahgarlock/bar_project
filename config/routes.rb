Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bars", to: "bars#index"
  get "/bars/:id", to: "bars#show"
  get "/kegs", to: "kegs#index"
  get "/kegs/:id", to: "kegs#show"
  get "/bars/:id/kegs", to: "bars/kegs#index"
end
