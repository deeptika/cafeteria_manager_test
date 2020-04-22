Rails.application.routes.draw do
  resources :carts
  resources :menu_items
  resources :menus
  resources :users
  resources :order_items
  resources :orders
  get "/", to: "sessions#new"
  get "/signin", to: "sessions#new", as: :new_sessions
  get "/home", to: "home#index"
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
