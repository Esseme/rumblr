Rails.application.routes.draw do
  namespace :admin do
    resources :articles
    resources :users

    root to: "articles#index"
  end
  resources :articles
  resources :users
  root "articles#new"
end
