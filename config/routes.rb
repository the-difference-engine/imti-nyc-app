Rails.application.routes.draw do
  devise_for :users, path: ''

  root :to => 'pages#index'
  get "/about" => 'pages#about'
  get "/contact" => 'pages#contact'
  
  resources :applications, only: [:new, :create, :edit, :update] do
  	resources :educations, only: [:new, :create, :edit, :update] 
  end
end
