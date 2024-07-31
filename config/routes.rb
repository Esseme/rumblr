Rails.application.routes.draw do
  namespace :admin do
    resources :articles
    resources :users

    root to: "articles#index"
  end
  resources :articles
  resources :users
  resources :authors, only: :show
  resources :comments
  resources :users,
    only: Clearance.configuration.user_actions do
      resource :password,
        controller: "passwords",
        only: [:edit, :update]
    end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "articles#new", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "articles#index"
  end
end
