Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :registrations
  resources :sessions
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  resources :articles do
    resources :comments
  end
end
