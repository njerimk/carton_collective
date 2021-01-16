Rails.application.routes.draw do

  resources :comic_pages, :users do 
    resources :comments, only: [:new, :index, :create]
    resources :image_elements
  end

  resources  :comics, :users do
    resources :likes, only: [:new, :index, :create]
    resources :image_elements
  end
  
  resources :comments, only: [:show, :edit, :update, :destroy]
  resources :likes, only: [:show, :edit, :update, :destroy] 
  
  resources :image_elements




#ComicPage
  # get 'comic_page/index'
  # get 'comic_page/show'
  # get 'comic_page/new'
  # get 'comic_page/create'
  # get 'comic_page/update'
  # get 'comic_page/edit'
  # get 'comic_page/destroy'

#Comics
#  get 'comics/index'
#   get 'comics/show'
#   get 'comics/new'
#   get 'comics/create'
#   get 'comics/update'
#   get 'comics/edit'
#   get 'comics/destroy'

#Comments 
# get 'comments/index'
#   get 'comments/show'
#   get 'comments/new'
#   get 'comments/create'
#   get 'comments/update'
#   get 'comments/edit'
#   get 'comments/destroy'

#Likes 
  # get 'likes/index'
  # get 'likes/show'
  # get 'likes/new'
  # get 'likes/create'
  # get 'likes/update'
  # get 'likes/edit'
  # get 'likes/destroy'
#Users 

  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/update'
  # get 'users/edit'
  # get 'users/destroy'
  

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end 
