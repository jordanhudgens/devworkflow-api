Rails.application.routes.draw do
  resources :check_list_items, only: [:create, :update]
  resources :project_line_items, only: [:show, :update]
  resources :projects, only: [:index, :create, :destroy, :update]
  resources :archived_projects, only: [:index, :update]
  resources :unarchive_projects, only: [:update]
  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  root to: 'home#index'
end
