Rails.application.routes.draw do
  root 'users#home_page'
  resources :products
  resources :users
  resources :sessions
  delete '/sessions', to: 'sessions#destroy', as: :logout
  get '/vendor/products', to: 'products#vendor_products', as: 'vendor_products'
  get '/cart', to: 'products#show_cart', as: 'show_cart'
  post 'products/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'
  delete '/cart_product/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
end
