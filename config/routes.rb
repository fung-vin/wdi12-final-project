Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks:  'api/omniauth_callbacks'
  }

  root 'static_pages#index'

  namespace :api do
    resources :tweets, only: [:index, :create]
  end
end
