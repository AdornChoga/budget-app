Rails.application.routes.draw do
  devise_for :user
  resource :user
  get 'home/index'
  root "home#index"
end
