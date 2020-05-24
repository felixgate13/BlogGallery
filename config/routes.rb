Rails.application.routes.draw do
  
  root 'pages#home', as: 'home'
  
  get 'pages/login', as: 'login'
  get 'pages/admin', as: 'admin'
  get 'pages/my_story', as: 'my_story'


  resources :gallery_posts
  resources :categories
  resources :blogs
end
