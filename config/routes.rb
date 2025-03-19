Rails.application.routes.draw do
  root "products#index"
  get "/products", to: "products#index"
  get "/products/new", to: "products#new"
  get "/products/:id", to: "products#show"
  post "/products", to: "products#create"
end
