Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace :api do
    namespace :v1 do
      post 'login' => 'authentication#authenticate_user'
      post 'sign_up' => 'authentication#sign_up'
      get 'users/me' => 'users#logged_in_user'
      resources :categories
      resources :movies
      resources :ratings
    end
  end
end
