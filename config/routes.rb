Rails.application.routes.draw do
  get 'solutions/index'
  get 'solutions/new'
  get 'solutions/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'movies#index'
  devise_for :users

  resources :questions
  resources :users, :texts
  resources :movies
end
