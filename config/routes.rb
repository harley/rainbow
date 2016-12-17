Rails.application.routes.draw do
  get '/view_as_admin' => 'admin/members#view_as_admin'
  get '/view_as_reader' => 'admin/members#view_as_reader'

  resources :reservations, only: [:show, :index]
  resources :check_out, only: [:index, :edit, :update]
  resources :check_in, only: [:index, :edit, :update]

  resources :members, except: [:show, :destroy]
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  resources :items do
    resources :reservations
    collection do
      get :added_by_me
    end
  end
  devise_for :users
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Example resource route within a namespace:
  namespace :admin do
      # Directs /admin/products/* to Admin::ProductsController
      # (app/controllers/admin/products_controller.rb)
    resources :members, only: [:index, :show]
    resources :reservations, only: [:index]
  end
end
