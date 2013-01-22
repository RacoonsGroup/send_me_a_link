SendMeALink::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :group_registrations, only: [:new, :create]

  root :to => "group_registrations#new"

end
