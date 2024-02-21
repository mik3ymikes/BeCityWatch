Rails.application.routes.draw do
  get 'sessions/create'

  scope '/' do
    post 'login', to:'sessions#create'
  
end
  resources :events 
  resources :users do
    end
    resources :alerts
  end