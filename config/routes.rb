Rails.application.routes.draw do

  get 'orders/details'

  get 'books/aboutus', :as => :aboutus

  get 'orders/show', :as => :orders

  get "cart" => "cart#show"
  get "cart/add/:id" => "cart#add", :as => :add_to_cart
  post "cart/remove/:id" => "cart#remove", :as => :remove_from_cart
  post "cart/checkout" => "cart#checkout", :as => :checkout
  post "cart/update/:id" => "cart#update", :as => :line_items_update

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
