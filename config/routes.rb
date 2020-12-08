Rails.application.routes.draw do
  get 'kontakt/index'

  get 'contact_me/index'

  resources :categories
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  get 'pages/charts', to: 'pages#charts'
  
  get 'pages/contact', to: 'pages#contact'
  get 'pages/about', to: 'pages#about'
  get 'pages/haccp', to: 'pages#haccp'
  
  
  get 'category/:title', to: 'category#category'
  
  resources :recipes do
    resources :comments, only: [:create]
        member do 
      post 'like'
    end
  end
  
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :ingredients, except: [:destroy]
  
  mount ActionCable.server => '/cable'
  
  get '/chat', to: 'chatrooms#show'

  resources :messages, only: [:create]
  
  get 'search', to: "search#search"
  
  resources :contacts, only: [:new, :create]
  

  root      'kontakt#index'
  resources :kontakt, only: [:index, :new, :create]

  
end