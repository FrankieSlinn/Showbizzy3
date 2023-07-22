Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
 # get 'show/my_shows', to: 'shows#myshows', as: 'my_shows'
  # get 'user/myshows', to: 'shows#myshows', as: 'my_shows'
  get '/user/myshows', to: 'shows#myshows'
  get '/shows/myreviews', to: 'shows#myreviews'
  get '/about', to: 'pages#about'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions'

  # post '/user/myshows', to: 'shows#myshows', as: 'user_myshows'
  delete '/shows/:id', to: 'shows#destroy', as: 'showdestroy'

  get 'pages/home'

  get 'pages/loggedin'


    # devise_for :users, controllers: {
    #   sessions: 'users/sessions'
    # }
    resources :userreviews
    resources :locations
    resources :datelocs
    resources :places
    resources :timings
    resources :shows
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#splash'

  # Rails.application.routes.draw do
  #   constraints subdomain: 'www' do
  #     get '/path', to: 'controller#action', protocol: 'https'
  #   end
  # end

end
