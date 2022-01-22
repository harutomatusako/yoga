Rails.application.routes.draw do
  
  
  get 'notifications/index'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  get "users/my_page"=>"users#index"
  resources :users, only: [:edit, :show, :update] do
    member do
      get :user_join
    end
  end
  resources :rooms
  resources :messages
  resources :events do
  collection do
    get 'search'
   end
  end

  resources :event_joins, only: [:create, :update]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

