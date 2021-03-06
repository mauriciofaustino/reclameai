Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :complaints, only: [:new, :create, :show]
  root to: redirect('/complaints/new')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
