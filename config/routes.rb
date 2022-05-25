Rails.application.routes.draw do
  devise_for :user
  resource :user
  resources :categories do
    resources :financial_transactions
  end
  get '/budget_app', to: "splash_screen#index"
  root 'root_handler#index'
end
