# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'todo_lists#index'

  resources :todo_lists do
    get :share, on: :member
    post :share_list, on: :member

    resources :todo_entries do
      member do
        get 'complete'
        get 'undo_complete'
      end
    end
  end
end
