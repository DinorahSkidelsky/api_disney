Rails.application.routes.draw do
  resources :items
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :characters
      resources :genres, only: :create
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
end
