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
    post '/save_preferences' => "users#save_preference"
    get '/get_preferences' => "users#get_preference"
    get 'instagrams_self' => "instagrams#get_self"
    get 'tweets_self' => "tweets#get_self"
  end

  root 'static_pages#index'
end
