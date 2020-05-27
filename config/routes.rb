Rails.application.routes.draw do
  

  get  'login', to: 'session#new'
  get  'welcome', to: 'sessions#welcome'
  post 'login', to: 'sessions#create'

  root 'pages#home', as: 'home'
  get 'pages/my_story', as: 'my_story'

  get 'pages/admin', as: 'admin'
  get 'blogs/admin', as: 'blogs/admin'
  get 'gallery_posts/admin', as: 'gallery_posts/admin'
  
  resources :sessions
  resources :users, only: [:new, :create]
  resources :gallery_posts
  resources :categories
  resources :blogs
end
