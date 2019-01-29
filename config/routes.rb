Rails.application.routes.draw do

  
  get 'rooms/show'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get  'static_pages/home'
  get 'sessions/new'
  get 'users/new'
  get 'welcome/index'
  get '/slots/new', to: 'slots#new',as:'new_slot'

resources :articles do
  resources :comments
end
resources :rooms do
 resources :slots
end
 root 'welcome#index'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
get '/rooms/new', to: 'rooms#new'
get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
get '/rooms', to: 'rooms#index'
post '/rooms',to:'rooms#create', as: 'create_room'
get '/rooms/:id/show', to: 'rooms#show', as: 'showroom'
get '/rooms/:room_id/slots',to: 'slots#index'
post '/rooms/:room_id/slots' , to: 'slots#create'
get '/rooms/:room_id/slots/:id/adduser', to: 'slots#adduser', as: 'add_slot_user'
get '/add_slotrecord', to: 'slotuserrecords#new'
post '/add_slotrecord', to: 'slotuserrecords#create'
get '/add_slotrecordshow', to: 'slotuserrecords#show'
resources :users
resources :account_activations, only: [:edit]
end
