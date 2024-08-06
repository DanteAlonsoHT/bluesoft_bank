Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'accounts#index'

  resources :accounts, only: [:index, :show] do
    member do
      post 'deposit'
      post 'withdraw'
    end
  end

  resources :users, only: [] do
    collection do
      post 'change_user'
    end
  end

  get 'reports/transactions_by_month', to: 'reports#transactions_by_month'
  get 'reports/withdrawals_outside_city', to: 'reports#withdrawals_outside_city'
end
