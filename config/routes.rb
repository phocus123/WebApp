Rails.application.routes.draw do
  resources :courses
  resources :contents

  resources :users do
    resources :contents
  end
  

  root to: "web_app#landing"
  get '/home', to: 'web_app#landing'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
