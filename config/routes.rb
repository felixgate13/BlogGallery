Rails.application.routes.draw do
  
  get 'pages/home'
  resources :gallery_posts
  resources :categories
  resources :blogs
end
