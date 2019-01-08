Rails.application.routes.draw do
  get 'posts/create'
  get 'posts/destroy'
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  get 'toppages/index'
  get 'toppages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  resources :posts, only: [:create, :show, :destroy]
end
