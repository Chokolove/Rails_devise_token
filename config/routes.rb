Rails.application.routes.draw do
  devise_for :users
  resources :foods
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/registrations',
      sessions: 'api/sessions'
     }
    resources :foods
  end
  root "foods#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
