Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  get 'pages/home'
  get 'pages/loggedin'

    # devise_for :users, controllers: {
    #   sessions: 'users/sessions'
    # }
    resources :shows
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
