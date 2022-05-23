Rails.application.routes.draw do
  get 'categories/index'
  get 'root_handler/index'
  devise_for :user
  resource :user
  resources :categories
  get '/budget_app', to: "splash_screen#index"
  root 'root_handler#index'
end
