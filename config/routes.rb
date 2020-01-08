Rails.application.routes.draw do
  root "static_pages#home"

  get "/contact", to: "static_pages#contact"
  get "/services", to: "static_pages#services"
  get "/doctors", to: "static_pages#doctors"
  get "/departments", to: "static_pages#departments"
  get "/signup", to: "accounts#new"
  post "/signup", to: "accounts#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :accounts
  resources :patients
  resources :appointments
  resources :select_doctors, only: %i(index)
  resources :doctors
end
