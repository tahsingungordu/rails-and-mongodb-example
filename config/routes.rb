Rails.application.routes.draw do
  resources :users, except: [:show]
  resources :posts

  root to: "users#index"
end