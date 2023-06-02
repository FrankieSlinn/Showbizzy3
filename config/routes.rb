Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
 # get 'show/my_shows', to: 'shows#myshows', as: 'my_shows'
  # get 'user/myshows', to: 'shows#myshows', as: 'my_shows'
  get '/user/myshows', to: 'shows#myshows'
  # post '/user/myshows', to: 'shows#myshows', as: 'user_myshows'
  delete '/shows/:id', to: 'shows#destroy', as: 'showdestroy'

  get 'pages/home'
  get 'pages/loggedin'


    # devise_for :users, controllers: {
    #   sessions: 'users/sessions'
    # }
    resources :reviews
    resources :locations
    resources :datelocs
    resources :places
    resources :timings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#splash'
end
