Rails.application.routes.draw do

  devise_for :users
  
  root to: "discussions#index"

  resources :discussions do
    resources :comments

    member do
      patch :bookmark
    end
  end
  resources :bookmarks, only: [:index]

  namespace :upload do
    post :image
  end

  get 'categories/:slug', to: 'categories#show', as: :category
end
