Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks:  'api/omniauth_callbacks'
  }

  namespace :api do
    resources :users, only: [:index]
    resources :tweets, only: [:index, :show, :create]
    resources :facebooks, only: [:index, :create]
    resources :instagrams, only: [:index, :create]
    resources :pinterests, only: [:index]
    resources :weathers, only: [:index]
    resources :nytimes, only: [:index]
    resources :dailymails, only: [:index]
    resources :bbcsports, only: [:index]
  end

  root 'static_pages#index'
end
