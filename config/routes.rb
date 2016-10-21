Rails.application.routes.draw do
  
  devise_for :users  

  authenticated :user do
    root 'photos#index', as: :authenticated_root
    
    resources :conversations do
      resources :messages
    end
    
    resources :ratings
    resources :photos

    resources :users, only: [:show]
  end
  root to: redirect('/users/sign_in')

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'users'

    resources :conversations do
      resources :messages
    end

    resources :photos
    resources :ratings, only: [:create, :destroy, :update]
    resources :users, only: [:show]
    
    get '/me', to: 'me#index'
    put '/me/update', to: 'me#update'
    
    post '/register', to: 'facebook#create'

    get '/leaders', to: 'leaderboard#index'

    namespace :admin do
      resources :photos
    end
  end

  namespace :admin do
    resources :photos
  end
end
