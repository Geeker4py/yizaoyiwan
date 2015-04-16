Rails.application.routes.draw do
  resources :bookmarks

  devise_for :users
  
  root to: "discussions#index"

  resources :discussions do
    resources :comments
  end

  namespace :upload do
    post :image
  end

  get 'categories/:slug', to: 'categories#show', as: :category
end
