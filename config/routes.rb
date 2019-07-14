Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :groups do
    resource :bulletin_board, only: [:show, :edit, :update]
    member do
      get "users"
      post "join"
      delete "leave"
      get "chat"
    end
    collection do
      get 'search'
    end
  end
  resources :users do
    member do
      get "groups"
      get "join_groups"
      get "chat"
    end
  end
  resource :profiles
end
