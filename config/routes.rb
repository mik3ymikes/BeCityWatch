Rails.application.routes.draw do
  get 'web/bootstrap'
  # get 'sessions/create'

  scope '/' do
    post 'login', to:'sessions#create'
end


  resources :events do
  #localhost:3000/events/1/join
  post 'join', to: 'events#join'
  #localhost:3000/events/1/leave
  delete 'leave', to: 'events#leave'
  end
  
  # resources :events do
  #   resources :comments, only: [:create, :index], controller: 'events/comments'
  # end


# check on this right below idk
resources :alerts 
resources :users do
  get 'alerts', to: "users#alerts_index"
end
end





