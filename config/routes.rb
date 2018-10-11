Rails.application.routes.draw do
  resources :projects, only: [:index, :create]
  resources :archived_projects, only: [:index, :update]
  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  root to: 'home#index'
end
