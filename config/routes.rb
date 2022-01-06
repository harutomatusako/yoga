Rails.application.routes.draw do
  get 'event_joins/create'
  get 'event_joins/index'
  get 'event_joins/show'
  devise_for :users
  get "users/my_page"=>"users#index"
  resources :users, only: [:edit, :show, :update]
  resources :events
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

