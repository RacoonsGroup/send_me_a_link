SendMeALink::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  resources :group_registrations, only: [:new, :create]

  resources :groups, only: [:show]

  constraints(Subdomain) do
    match '/' => 'groups#show'
  end

  root :to => "group_registrations#new"

end
