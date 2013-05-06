Bizonapps::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  match '/index', :to => 'pages#index'
  match '/blog', :to => 'pages#blog'
  match '/portfolio', :to => 'pages#portfolio'
  match '/team', :to => 'pages#team'
  match '/pages/getInfoUser'
  match '/pages/getInfoPortfolio'

  root :to => 'pages#index'
end