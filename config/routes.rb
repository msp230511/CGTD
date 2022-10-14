Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :todo_entries
  # Defines the root path route ("/")
  # root "articles#index"
  root "todo_entries#index"

end
