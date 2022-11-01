Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :characters
      resources :genres, only: :create
    end
  end
end
