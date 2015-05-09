Rails.application.routes.draw do
  get 'signin', to: 'user_sessions#new'
  post 'signin', to: 'user_sessions#create'
  delete 'signout', to: 'user_sessions#destroy'

  # devise_for :users
  
  root to: "discussions#index"

  resources :discussions do
    resources :comments

    member do
      patch :bookmark
    end
  end

  namespace :upload do
    post :image
  end

  get 'categories/:slug', to: 'categories#show', as: :category
end
