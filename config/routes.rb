Blog::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :posts

    root to: 'dashboard#index'
  end

  get '/:id', to: 'posts#show', as: :post

  root to: 'posts#index'
end
