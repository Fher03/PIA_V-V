Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "products#index"

  resources :products
end
