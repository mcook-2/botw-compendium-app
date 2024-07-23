Rails.application.routes.draw do
  resources :treasure_drops
  resources :treasure_locations
  resources :creature_drops
  resources :creature_locations
  resources :material_locations
  resources :equipment_locations
  resources :monster_drops
  resources :monster_locations
  resources :drops
  resources :locations
  resources :treasures
  resources :creatures
  resources :materials
  resources :equipment_properties
  resources :equipment
  resources :monsters

  root 'pages#home'
  get 'pages/home'
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
