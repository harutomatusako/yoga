Rails.application.routes.draw do
  devise_for :users
  get "users/my_page"=>"users#index"
  resources :users, only: [:edit, :show, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
