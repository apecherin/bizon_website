Bizonapps::Application.routes.draw do

  resources :blogs do
    collection do
      get 'login'
    end
  end

  resources :products
  resources :payments

  resources :comments, only: [:destroy] do
    collection do
      post 'addComment'
      post 'deleteComment'
    end
  end

  devise_for :admins
  as :admin do
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  end


  devise_for :users
    #as :user do
    #end

  match '/index', :to => 'pages#index'
  match '/portfolio', :to => 'pages#portfolio'
  match '/team', :to => 'pages#team'
  match '/pages/getInfoUser'
  match '/pages/getInfoPortfolio'
  match '/search/addIndex'
  match '/search/autoComplete'


  root :to => 'pages#index'
end