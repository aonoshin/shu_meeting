Rails.application.routes.draw do

  resources :admins, only: [:index]

  # get 'participations/index'

  root "homes#top"

  
   devise_for :users, :controllers => {
     :registrations => 'users/registrations',
     :sessions => 'users/sessions'
    } 
    
  resources :users, only: [:edit, :update, :show] do
    post 'friends/accept' => 'friends#accept'
    delete 'friends/destroy_sub' => 'friends#destroy_sub'
    resources :photos
    resources :rooms
    resources :friends, only: [:index, :new, :create]
  end
  
  resources :friends, only: [:show] do
    resources :messages
  end
  
  resources :homes
  resources :posts
  resources :boards
  resources :news
  resources :voices
  resources :participations
  resources :users, only: [:index]
  resources :questions
  
  resources :inquiries do 
    resources :answers
  end
  
end
