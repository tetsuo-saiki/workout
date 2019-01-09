Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  get 'toppages/index'
  get 'toppages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  resources :posts, only: [:create, :show, :destroy]
  resources :comments, only: [:create, :edit, :destroy]
  resources :tags, only: [:new, :create, :destroy]
  resources :tag_relations, only: [:new, :create, :destroy]
end
