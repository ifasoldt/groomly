Rails.application.routes.draw do

  root 'sessions#new'
  resources :votes
  resources :users
  resources :tickets
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
