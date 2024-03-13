Rails.application.routes.draw do
  get 'web/bootstrap'
  # get 'sessions/create'

  scope '/' do
    post 'login', to:'sessions#create'
end

# this works last one i had
  resources :events 
  
  # resources :events do
  #   resources :comments, only: [:create, :index], controller: 'events/comments'
  # end


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



  # resources :events 
  # resources :users do
  #   get 'events', to: "users#events_index"
  # end