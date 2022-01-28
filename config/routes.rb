Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    root 'posts#index'

    resources :posts, except: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
