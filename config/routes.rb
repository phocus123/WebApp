Rails.application.routes.draw do
  resources :user_courses, :except => [:index]
  resources :course_contents, :except => [:index]
  resources :courses, :except => [:index]
  resources :contents, :except => [:index]
  resources :users , :except => [:index] do
    resources :contents , :except => [:index]
  end
  root to: "web_app#landing"
  get '/home', to: 'web_app#landing'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
