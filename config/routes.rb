Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: {format: 'json'} do
    resources :posts do
      resources :comments
    end
    resources :sessions, only: [:create, :destroy, :show]
    resources :users, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
