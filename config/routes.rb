Rails.application.routes.draw do
  root 'employees#index'
  # root 'students#index'

  resources :employees

  resources :todos


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
