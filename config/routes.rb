Rails.application.routes.draw do
  
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  root 'pages#home', as: 'home'
  get 'pages/my_story', as: 'my_story'


  resources :gallery_posts
  resources :categories
  resources :blogs
end
