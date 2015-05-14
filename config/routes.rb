Rails.application.routes.draw do
  get 'signin', to: 'user_sessions#new'
  post 'signin', to: 'user_sessions#create'
  delete 'signout', to: 'user_sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  #get 'profile', to: 'users#show'
  #get 'edit_profile', to: 'users#edit'
  #patch 'profile', to: 'users#update'

  root to: "discussions#index"

  resources :discussions do
    resources :comments

    member do
      patch :bookmark
    end
  end

  namespace :profile, controller: :profile do
    get '', action: :index
    
    resource :password, only: [:show, :update]
  end

  namespace :upload do
    post :image
  end

  get 'categories/:slug', to: 'categories#show', as: :category
end
