Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'toppages#index'
  get 'toppages/index'

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:index, :show]
  resources :posts, only: [:create, :show, :destroy]
  resources :comments, only: [:create, :edit, :destroy]
  resources :tags, only: [:new, :create, :destroy]
  resources :tag_relations, only: [:new, :create, :destroy]
  resources :like_relations, only: [:show, :create, :destroy]
  resources :follow_relations, only: [:create, :destroy]
end
