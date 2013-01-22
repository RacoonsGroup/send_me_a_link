SendMeALink::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :users
  resources :registrations, except: :index
  resources :groups

  root :to => "registrations#new"

end
