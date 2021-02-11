Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chatroom#index'

  #session set and destroy routes
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  #create a message
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
end
