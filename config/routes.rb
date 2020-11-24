Rails.application.routes.draw do
  resources :user_items
  devise_for :users
  root "home#index"
  get "my_page", to: "users#my_page"
  resources :items
end
