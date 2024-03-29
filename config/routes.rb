Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :rooms do
    resources :users, only: %i[create destroy]
  end

  resources :users, only: %i[edit update]
  resources :games, only: %i[create show]

  mount ActionCable.server => '/cable'
end
