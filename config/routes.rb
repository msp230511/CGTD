# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todo_entries
  devise_for :user
  root 'todo_entries#index'
  post 'todo_entries/new', to: 'todo_entries#new'
  put 'todo_entries/:id/edit' => 'todo_entries#edit'

  resources :todo_entries do
    member do
      get 'complete'
      get 'undo_complete'
      get 'delete'
    end
  end

  resources :todo_lists 
end
