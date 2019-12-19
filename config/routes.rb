Rails.application.routes.draw do

  resources :products
  root 'home_pages#home'
  
  get   '/help',    to: 'home_pages#help'
  get   '/about',   to: 'home_pages#about'
  get   '/contact', to: 'home_pages#contact'
  get   '/signup',  to: 'users#new'
  get   '/signin',  to: 'sessions#new'
  post  '/signin',  to: 'sessions#create'
  get   '/signout', to: 'sessions#destroy'
  
  resources :users do
    resources :addresses   
  end

  resources :stores

  resources :products do
    resources :comments
    resources :carts, only: [:create, :destroy, :new]
  end

  resources :orders do
    resources :order_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
