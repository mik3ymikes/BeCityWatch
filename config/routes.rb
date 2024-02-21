Rails.application.routes.draw do
    resources :users do
    end
    resources :alerts, only: [:create, :update, :destroy]
  end