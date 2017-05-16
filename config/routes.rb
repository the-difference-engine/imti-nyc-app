Rails.application.routes.draw do
  devise_for :users, path: '', controllers: {registrations: 'users/registrations'}
  as :user do
    get '/schools/sign_up', to: 'users/registrations#new_school'
    post '/users/registrations/', to: 'users/registrations#import'
  end
  root :to => 'pages#index'
  get "/about" => 'pages#about'
  get "/contact" => 'pages#contact'
  get "/template" => 'pages#template'

  resources :applications, only: [:index, :new, :show, :create, :edit, :update] do
  	resources :educations, only: [:index, :new, :create, :edit, :update]
  	resources :montessori_trainings, only: [:index, :new, :create, :edit, :update]
  	resources :work_experiences, only: [:index, :new, :create, :edit, :update]
    resources :references, only: [:index, :new, :create, :edit, :update]
  	resources :documents, only: [:index, :new, :create, :edit, :update]
  end

  resources :school_profiles, only: [:index, :new, :create, :edit, :update] do
  end

  resources :local_schools, only: [:index, :new, :create, :edit, :update]

  resources :registrants
  resources :workshops
  resources :charges
  resources :courses
  resources :course_registrations
end
