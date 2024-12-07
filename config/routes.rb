Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root 'cafes#index'
  
  # get '/cafes/login' => 'cafe_sessions#new'
  # get '/cafes/profile' => 'cafes#show'
  # post '/cafes/borough' => 'cafes#borough'
  # post '/cafes/neighborhood' => 'cafes#neighborhood'
  # post '/coffee_gifts/filter' => 'coffee_gifts#filter'

  # resources :cafes, only: [:index, :show, :update] do
  #   resources :coffee_gifts, only: [:new, :create]
  # end

  # resources :menu_items, only: [:destroy, :create, :update]
  # resources :users, only: [:create, :edit, :update]
  # resources :coffee_gifts, only: [:show, :update]
  # resources :transactions, only: [:new, :create]

  # get '/login' => 'user_sessions#new'
  # post '/users/sessions' => 'user_sessions#create'
  # delete '/logout' => 'user_sessions#destroy'
  # get '/profile' => 'users#show'
  # get '/register' => 'users#new'
  # get '/confirmation/:id' => 'coffee_gifts#confirm', as: "confirmation"

  # get '/redemption_confirmation/:id' => 'coffee_gifts#confirm_redemption', as: "redemption_confirmation"

  # post '/cafes/sessions' => 'cafe_sessions#create'
  # delete '/cafes/logout' => 'cafe_sessions#destroy'
end
