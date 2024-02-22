Rails.application.routes.draw do
  # get 'sessions/create'

  scope '/' do
    post 'login', to:'sessions#create'
end

  resources :events 


# check on this right below idk
resources :alerts 
resources :users do
  get 'alerts', to: "users#alerts_index"
end
end

# this last known working
  # resources :users do
  #   end
  #   resources :alerts
  # end