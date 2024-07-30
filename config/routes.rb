Rails.application.routes.draw do
  resources :drops
  resources :locations
  resources :treasures
  resources :creatures
  resources :materials
  resources :equipment
  resources :monsters

  root 'pages#home'
  get 'pages/home'
  get 'about', to: 'pages#about'
  get 'search', to: 'search#index'
  get "creatures/index"
  get "treasures/index"
  get "materials/index"
  get "equipment/index"
  get "monsters/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
