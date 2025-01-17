Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "therapists", to: 'pages#index'
  get "patients", to: 'pages#patients'
  # get "visio", to: 'pages#visio'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :appointments, only: [:index, :edit, :update] do
    resources :prescriptions, only: [:new, :create, :edit, :update]
    resources :feedbacks, only: [:index, :new, :create, :edit, :update]
    get "visio", to: 'pages#visio'
   end
  resources :prescriptions, only: :index
  # Path : donne la racine du chemin /therapists/
  # as : donne la dépendance /therapist_id
  resources :users, only: [:index, :show], :path => :therapists, as: :therapists do
    resources :appointments, only: [:new, :create, :show]
    resources :appointments, only: :destroy, as: :appointment_delete
    end

end
