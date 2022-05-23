Rails.application.routes.draw do
  get 'splash_screen/index'
  get 'categories/index'
  get 'root_handler/index'
  devise_for :user
  resource :user
  root 'root_handler#index'
end
