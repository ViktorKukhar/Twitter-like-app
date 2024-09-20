Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :public
  get "up" => "rails/health#show", as: :rails_health_check
  root "public#index"
end
