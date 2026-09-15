Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books do
    member do
      get :delete
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "user_books#index"
end
