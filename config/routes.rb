Movitic::Application.routes.draw do
  
  root :to => 'movies#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  match '/movies/search' => 'movies#search', :as => "search"

  resources :users 
  resources :sessions
  resources :movies
  
end
