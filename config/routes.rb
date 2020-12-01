Rails.application.routes.draw do
  resources :items
  resources :categories
  devise_for :users
  root "home#index"
  get "my_page", to: "users#my_page"
end
