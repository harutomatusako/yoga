Rails.application.routes.draw do
 
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  get "users/my_page"=>"users#index"
  resources :users, only: [:edit, :show, :update]
  resources :events
  resources :event_joins, only: [:create, :update]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

