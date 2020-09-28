Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :projects, except: [:index]
  resources :tasks, only: [:create, :destroy]
end
