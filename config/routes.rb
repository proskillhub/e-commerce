Rails.application.routes.draw do
  
  namespace :customer do
    get '/checkouts/order_place', :to => 'checkouts#orderplace'
    resources :products, :carts, :orders, :checkouts
  end


  namespace :supplier do
    resources :products
  end

  namespace :admin do
    resources :users
  end
  
  root 'homes#index'
  resources :homes

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
