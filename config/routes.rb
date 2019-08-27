Rails.application.routes.draw do
  root "drinks#index"
  devise_for :users

  resources :drinks
end
