Rails.application.routes.draw do
  devise_for :users
  resources :foods
  namespace :api do
    resources :foods
  end
  root "foods#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
