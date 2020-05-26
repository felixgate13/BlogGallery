Rails.application.routes.draw do
  

  get 'login', to: 'sessions#new'
  get 'welcome', to: 'sessions#welcome'
  post 'sessions#new', to: 'sessions#create'


  root 'pages#home', as: 'home'
  get 'pages/my_story', as: 'my_story'

  get 'pages/admin', as: 'admin'
  get 'blogs/admin', as: 'blogs/admin'
  get 'gallery_posts/admin', as: 'gallery_posts/admin'


  resources :users, only: [:new, :create]
  resources :gallery_posts
  resources :categories
  resources :blogs
end
