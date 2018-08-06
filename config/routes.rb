Rails.application.routes.draw do
  #resources :users, :only => [:show], :defaults => { :format => 'json' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => "users" }

  get 'lti/launch'
  post 'lti/launch'
  #get '/users/sign_out'
  #get 'posts', to: 'posts#index'
  root 'posts#index', as: 'home'


  resources :posts do 
  	resources :comments
  end


end


