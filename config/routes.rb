Rails.application.routes.draw do
  root "static_pages#home"

  get "/contact", to: "static_pages#contact"
  get "/services", to: "static_pages#services"
  get "/doctors", to: "static_pages#doctors"
  get "/departments", to: "static_pages#departments"
  get "/signup", to: "accounts#new"
  post "/signup", to: "accounts#create"

  resources :accounts
end
