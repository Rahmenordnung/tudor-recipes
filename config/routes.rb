Rails.application.routes.draw do
  resources :categories
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  get 'pages/charts', to: 'pages#charts'
  
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
  
end