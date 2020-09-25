Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :projects
  resources :tasks, only: [:index, :create, :destroy]
end
