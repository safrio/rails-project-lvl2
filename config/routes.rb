# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    root 'posts#index'

    resources :posts, only: %w[create show new] do
      scope module: :posts do
        resources :comments, only: :create
        resources :likes, only: %w[create destroy]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
