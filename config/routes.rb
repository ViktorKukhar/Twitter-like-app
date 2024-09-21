Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "home#index"
  resources :home
  get "up" => "rails/health#show", as: :rails_health_check
end
