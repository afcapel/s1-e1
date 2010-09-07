Librarian::Application.routes.draw do

  devise_for :users

  root :to => "home#index"
  
  match 'twitter/login', :to => "twitter_sessions#new"
  match 'oauth_callback', :to => "twitter_sessions#create"
  
  match 'profile', :to => "users#show" 
  
  resources :catalogations
  resources :books
  resources :libraries do
    member do
        post 'update_feed'
    end
  end
  
  post "tweet/like", :to => "tweets#like"
  post "tweet/reading", :to => "tweets#reading"
end
