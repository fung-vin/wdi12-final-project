Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks:  'api/omniauth_callbacks'
  }

  namespace :api do
    resources :tweets, only: [:index, :create]
    resources :facebooks, only: [:index, :create]
    resources :instagrams, only: [:index, :create]
    resources :gmails, only: [:index]
    resources :pinterests, only: [:index]
  end

  root 'static_pages#index'
end
