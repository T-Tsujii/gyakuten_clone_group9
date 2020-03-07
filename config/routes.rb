Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'index' => 'movies#index'
  root 'movies#index'
  devise_for :users

  resources :questions
  resources :users, :texts
end
