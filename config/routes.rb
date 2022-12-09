# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'todo_lists#index'

  resources :todo_lists do
    member do
      patch :archive
      patch :unarchive
      get :share
      post :share_list
      get :reactivate
    end

    resources :todo_entries do
      member do
        get 'complete'
        get 'undo_complete'
      end
    end
  end
end
