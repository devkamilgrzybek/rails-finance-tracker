Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :friendships
  
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :id, except: [:index]
  resources :messages
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: "stocks#search"
  get 'my_friends', to: "users#my_friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
