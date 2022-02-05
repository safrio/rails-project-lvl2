Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    root 'posts#index'

    resources :posts, only: %w[create show new] do
      resources :comments, only: :create, module: 'posts'
      resources :likes, only: :create, module: 'posts'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
