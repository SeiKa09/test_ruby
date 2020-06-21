Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "home#index"

  resources :accounts
  resources :transactions
  namespace :api, defaults: { format: :json } do
    resources :users, only: [] do
      member do
        get :transactions
        post :transactions, to: 'users#create_transaction'
      end
    end
  end
end
