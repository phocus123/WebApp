Rails.application.routes.draw do
  resources :course_contents
  root to: "web_app#landing"
  get '/home', to: 'web_app#landing'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users do
    resources :contents
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
