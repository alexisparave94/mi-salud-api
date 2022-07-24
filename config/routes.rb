Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  resources :products

  get "/search" => "products#search"
  get "/last" => "products#last"
end
