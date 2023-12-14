Rails.application.routes.draw do
  root 'appointments#index'

  resources :appointments, only: %i[ create destroy ]

  get "up" => "rails/health#show", as: :rails_health_check
end
