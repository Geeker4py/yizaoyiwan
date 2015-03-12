Rails.application.routes.draw do
  devise_for :users
  
  root to: "discussions#index"

  resources :discussions do
    resources :comments
  end

  get 'categories/:slug', to: 'categories#show', as: :category
end
