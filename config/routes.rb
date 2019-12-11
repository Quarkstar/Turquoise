Rails.application.routes.draw do
  resources :stores
  root 'home_pages#home'
  
  get   '/help',    to: 'home_pages#help'
  get   '/about',   to: 'home_pages#about'
  get   '/contact', to: 'home_pages#contact'
  get   '/signup',  to: 'users#new'
  get   '/signin',  to: 'sessions#new'
  post  '/signin',  to: 'sessions#create'
  get   '/signout', to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
