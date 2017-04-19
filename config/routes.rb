Rails.application.routes.draw do
  resources :user_courses
  resources :course_contents
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
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/new_course',  to: 'courses#new'
  post '/new_course',  to: 'courses#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
