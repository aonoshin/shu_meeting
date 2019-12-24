Rails.application.routes.draw do

  root "homes#top"
  
   devise_for :users, :controllers => {
     :registrations => 'users/registrations',
     :sessions => 'users/sessions'
    } 
    
  resources :users, only: [:edit, :update, :show] do
    resources :photos
  end
  
  # resources :users do
  #   member do
  #     get :following, :followers, :user_tweets
  #   end
  #   resources :friends, only:[:create, :destroy]
  # end

  resources :posts
  resources :boards
  resources :rooms

end
