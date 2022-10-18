Rails.application.routes.draw do
  resources :todo_entries
  root 'todo_entries#index'
end
