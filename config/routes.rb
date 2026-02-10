Rails.application.routes.draw do
  resources :recipes
  resources :tags, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check
end
