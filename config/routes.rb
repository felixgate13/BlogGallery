Rails.application.routes.draw do
  

  get 'login', to: 'sessions#new'
  get 'welcome', to: 'sessions#welcome'
  post 'sessions#new', to: 'sessions#create'


  root 'pages#home', as: 'home'
  get 'pages/my_story', as: 'my_story'

  resources :users, only: [:new, :create]
  resources :gallery_posts
  resources :categories
  resources :blogs
end
