Rails.application.routes.draw do
  resources :events 
  resources :users do
    end
    resources :alerts
  end