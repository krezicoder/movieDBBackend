Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace :api do
    namespace :v1 do
      resources :categories
      resources :movies
      resources :ratings
      post 'login' => 'authentication#authenticate_user'
      post 'sign_up' => 'authentication#sign_up'
    end
  end
end
