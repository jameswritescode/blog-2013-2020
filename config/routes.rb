Blog::Application.routes.draw do
  devise_for :users
  get '/:id', to: 'posts#show', as: :post

  root to: 'posts#index'
end
