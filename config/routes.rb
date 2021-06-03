Rails.application.routes.draw do
  resources :categories 
  get '/' => 'sessions#home' 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' 
  post '/signup' => 'users#create' 
  get '/logout' => 'sessions#destroy'

  get '/auth/:google_oauth2/callback' => 'sessions#google_omniauth_create'
  
  resources :reviews
  resources :animes do
    resources :reviews, only: [:new, :index]
  end

  resources :users, only: [:show]
end
