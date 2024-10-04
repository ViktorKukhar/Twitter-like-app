Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :home
  resources :tweets
end
