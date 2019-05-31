Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  devise_scope :user do
    get 'signupsns' => 'users/registrations#newsns', as: :newsns_user_registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :groups
  resources :users
  resource :profile
end
