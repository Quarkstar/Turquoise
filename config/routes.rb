Rails.application.routes.draw do
  get 'users/new'
  root 'home_pages#home'
  
  get '/help',  to: 'home_pages#help'
  get '/about', to: 'home_pages#about'
  get '/contact', to: 'home_pages#contact'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
