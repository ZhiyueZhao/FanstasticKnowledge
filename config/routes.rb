Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}
  resources :books

  root to: 'books#index'

  get 'cust', :to => 'access#menu'
  get 'access/menu'

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
