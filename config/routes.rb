Rails.application.routes.draw do

  root "index#index"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :purchase, only: [:index]
  resources :logout, only: [:index]
  resources :mypages, only: [:index]
  resources :item_page, only: [:index]
  resources :comp_reg, only: [:index]
  resources :products, only: [:index]
  resources :sign_up, only: [:index, :new, :create]
  resources :login, only: [:index]
  resources :users
  resources :creditcard, only:[:index, :new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'delete', to: 'creditcard#delete'
    end
  end 
end
